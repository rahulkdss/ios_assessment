//
//  DetailsRouter.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//
import UIKit
import Foundation

protocol DetailsRouterProtocol: AnyObject {
    func goBack()
    func reloadPage()
}

class DetailsRouter: DetailsRouterProtocol {
    weak var viewController: UIViewController?
    
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func reloadPage() {
        
    }
}
