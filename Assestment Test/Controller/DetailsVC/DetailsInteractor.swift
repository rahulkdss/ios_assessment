//
//  DetailsInteractor.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//

import Foundation

// MARK: - Interactor
protocol DetailsInteractorDelegate: AnyObject {
    func reloadData()
}

protocol DetailsInteractorProtocol: AnyObject {
}


class DetailsInteractor: DetailsInteractorProtocol {
    weak var delegate: DetailsInteractorDelegate?
    
    func reloadButtonTapped() {
        delegate?.reloadData()
    }
}
