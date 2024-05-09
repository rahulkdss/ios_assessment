//
//  ListingRouter.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//
import UIKit
import Foundation

// MARK: - Router
protocol ListingRouterProtocol: AnyObject {
    // Define routing methods here
    static func createModule()-> ListingVC
    func navigateToUniversityDetails(with university: UniversitiesModel)
}

class ListingRouter: ListingRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> ListingVC {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ListingVC") as! ListingVC
        
        var presenter: ListingPresenterView & ListingInteractorOutputProtocol = ListingPresenter()
        var interactor: ListingInteractorProtocol = ListingInteractor()
        var router: ListingRouterProtocol = ListingRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        
        return view
        
    }
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func navigateToUniversityDetails(with university: UniversitiesModel) {
        let detailsVC = DetailsVC()
        let detailsInteractor = DetailsInteractor()
        let detailsRouter = DetailsRouter()
        detailsInteractor.delegate = viewController as? DetailsInteractorDelegate
        let detailsPresenter = DetailsPresenter(view: detailsVC, interactor: detailsInteractor, router: detailsRouter, university: university)
        detailsVC.presenter = detailsPresenter
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
