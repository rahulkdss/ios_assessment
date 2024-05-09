//
//  ListingPresenter.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//
import UIKit
import Foundation

// MARK: - Presenter

protocol ListingPresenterView {
    var view: ListingViewProtocol? {get set}
    var interactor: ListingInteractorProtocol? {get set}
    var router: ListingRouterProtocol? {get set}
    func didSelectUniversity(at index: Int)
}

protocol ListingPresenterProtocol: AnyObject {
    func viewLoad()
    func didSelectUniversity(at index: Int)
    var view: ListingViewProtocol? {get set}
}

protocol ListingInteractorOutputProtocol: AnyObject {
    func universitiesFetched(_ universities: [UniversitiesModel])
}

class ListingPresenter: ListingPresenterProtocol, ListingInteractorOutputProtocol, ListingPresenterView {
    var presenter: ListingPresenterProtocol!
    var view: ListingViewProtocol?
    var interactor: ListingInteractorProtocol?
    var router: ListingRouterProtocol?

    func viewLoad() {
        interactor = ListingInteractor()
        interactor?.output = self
        interactor?.fetchUniversities()
    }

    func universitiesFetched(_ universities: [UniversitiesModel]) {
        view = ListingVC()
        view?.showUniversities(universities)
    }

    func onError(message: String) {
        view?.showError(message: message)
    }

    func didSelectUniversity(at index: Int) {
        // Implement navigation to details view here
    }
}

