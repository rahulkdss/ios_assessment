//
//  DetailsPresenter.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func backButtonTapped()
    func reloadButtonTapped()
}


// DetailsPresenter.swift
class DetailsPresenter: DetailsPresenterProtocol {
    weak var view: DetailsViewProtocol?
    var interactor: DetailsInteractorProtocol!
    var router: DetailsRouterProtocol!
    var university: UniversitiesModel
    
    init(view: DetailsViewProtocol, interactor: DetailsInteractorProtocol, router: DetailsRouterProtocol, university: UniversitiesModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.university = university
    }
    
    func viewDidLoad() {
        view?.displayUniversityDetails(university)
    }
    
    func backButtonTapped() {
        self.router.goBack()
    }
    
    func reloadButtonTapped() {
        self.router.reloadPage()
    }
}
