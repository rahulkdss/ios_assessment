//
//  ListingInteractor.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//

import Foundation
import Alamofire
import RealmSwift
import Reachability

// MARK: - Interactor
protocol ListingInteractorProtocol: AnyObject {
    var output: ListingInteractorOutputProtocol? { get set }
    func fetchUniversities()
}

class ListingInteractor: ListingInteractorProtocol, DetailsInteractorDelegate {
    var output: ListingInteractorOutputProtocol?
    
    func fetchUniversities() {
        //output = ListingPresenter()
        if isInternetAvailable() {
            let param = ["country": "United Arab Emirates"]
            let URL = "http://universities.hipolabs.com/search"
            AF.request(URL, method: .get, parameters: param, encoding: URLEncoding.default, headers: [:]).responseData { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let data):
                    do {
                        let universities = try JSONDecoder().decode([UniversitiesModel].self, from: data)
                        self.saveData(universities)
                        self.output?.universitiesFetched(universities)
                    } catch {
                        let universities = self.retriveData()
                        self.output?.universitiesFetched(universities)
                    }
                case .failure(let error):
                    let universities = self.retriveData()
                    self.output?.universitiesFetched(universities)
                    print("Error fetching universities: \(error.localizedDescription)")
                }
            }
        } else {
            let universities = self.retriveData()
            self.output?.universitiesFetched(universities)
        }
        
        
    }
    
    // Check Internet
    private func isInternetAvailable() -> Bool {
        let reachability = try! Reachability()
        return reachability.connection != .unavailable
    }
    
    // MARK: - Save Data on Realm
    func saveData(_ universities: [UniversitiesModel]) {
        let realm = try! Realm()
        for universityData in universities {
            let universities = realm.objects(University.self).filter("name == %@", universityData.name ?? "")
            guard universities.isEmpty else { continue }
            let university = University()
            university.name = universityData.name ?? ""
            university.stateProvince = universityData.stateProvince
            university.alphaTwoCode = universityData.alphaTwoCode
            university.country = universityData.country
            if let arrDomains = universityData.domains {
                university.domains.append(objectsIn: arrDomains)
            }
            if let arrWebpages = universityData.webPages {
                university.webPages.append(objectsIn: arrWebpages)
            }
            try! realm.write {
                realm.add(university)
            }
            
        }
    }
    
    private func retriveData() -> [UniversitiesModel] {
        let realm = try! Realm()
        let universities = realm.objects(University.self)
        var arrUniversities = [UniversitiesModel]()
        for university in universities {
            var dictUniversities = UniversitiesModel()
            dictUniversities.name = university.name
            dictUniversities.stateProvince = university.stateProvince ?? ""
            dictUniversities.alphaTwoCode = university.alphaTwoCode ?? ""
            dictUniversities.country = university.country
            dictUniversities.domains = Array(university.domains)
            dictUniversities.webPages = Array(university.webPages)
            arrUniversities.append(dictUniversities)
        }
        return arrUniversities
    }
    // Details Page Reload Data
    func reloadData() {
        fetchUniversities()
    }
    
}


