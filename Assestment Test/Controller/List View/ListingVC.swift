//
//  ListingVC.swift
//  Assestment Test
//
//  Created by Admin on 07/05/24.
//

import UIKit
import Alamofire
import RealmSwift
import Reachability

protocol ListingViewProtocol: AnyObject {
    func showUniversities(_ universities: [UniversitiesModel])
    func showError(message: String)
}

class ListingVC: UIViewController, ListingViewProtocol {
    // MARK: - All Outlet
    @IBOutlet var tblVw: UITableView!
    // MARK: - Intilize Varriable
    var presenter: ListingPresenterView!
    private var arrUniversity: [UniversitiesModel] = []
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblVw.register(UINib(nibName: "UniversitiesListTC", bundle: nil), forCellReuseIdentifier: "UniversitiesListTC")
        let interactor = ListingInteractor()
        let presenter = ListingPresenter()
        presenter.view = self
        presenter.interactor = interactor
        self.presenter = presenter
        
        presenter.viewLoad()
    }
    func showUniversities(_ universities: [UniversitiesModel]) {
        self.arrUniversity = universities
        debugPrint(self.arrUniversity)
        tblVw.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
// MARK: - TableView DataSource and Delegate Method
extension ListingVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrUniversity.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversitiesListTC", for: indexPath) as! UniversitiesListTC
        let dictUniversity = self.arrUniversity[indexPath.row]
        cell.lblUniversityName.text = dictUniversity.name ?? ""
        cell.lblUniversityState.text = dictUniversity.stateProvince ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectUniversity(at: indexPath.row)
    }
}
//// MARK: - Reload Page Delegate Method
//extension ListingVC: RefershPageDelegate {
//    func refershPage() {
//        self.getUniviersityListAPI()
//    }
//}
