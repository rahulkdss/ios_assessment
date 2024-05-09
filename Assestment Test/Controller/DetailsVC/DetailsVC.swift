//
//  DetailsVC.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func displayUniversityDetails(_ university: UniversitiesModel)
}

class DetailsVC: UIViewController, DetailsViewProtocol {
    // MARK: - All Outlet
    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityState: UILabel!
    @IBOutlet weak var lblUniversityCountry: UILabel!
    @IBOutlet weak var lblUniversityCountryCode: UILabel!
    @IBOutlet weak var lblUniversityWeb: UILabel!
    // MARK: - Intilize Varriable
    var presenter: DetailsPresenterProtocol!
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    // MARK: - Set Data
    func displayUniversityDetails(_ university: UniversitiesModel) {
        self.lblUniversityName.text = university.name ?? ""
        self.lblUniversityState.text = university.stateProvince ?? ""
        self.lblUniversityCountry.text = university.country ?? ""
        self.lblUniversityCountryCode.text = university.alphaTwoCode ?? ""
        if let strWebPage = university.webPages?[0] as? String {
            self.lblUniversityWeb.text = strWebPage
        }
    }
    // MARK: - All Button Action
    @IBAction func btnBackClk(_ sender: UIButton) {
        self.presenter.backButtonTapped()
    }
    @IBAction func btnReloadClk(_ sender: UIButton) {
        self.presenter.reloadButtonTapped()
    }
}
