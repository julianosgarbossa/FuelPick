//
//  CalculatorViewModel.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import Foundation

protocol CalculatorViewModelDelegate: AnyObject {
    func success(bestFuel: BestFuel)
    func failure()
}

final class CalculatorViewModel {
    private weak var delegate: CalculatorViewModelDelegate?
    
    func delegate(delegate: CalculatorViewModelDelegate) {
        self.delegate = delegate
    }
    
    private func validateTextFields(ethanolPrice: String, gasPrice: String) -> Bool {
        if ethanolPrice.isEmpty || gasPrice.isEmpty {
            return false
        }
        return true
    }
    
    func calculate(ethanolPrice: String, gasPrice: String) {
        if validateTextFields(ethanolPrice: ethanolPrice, gasPrice: gasPrice) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            guard let ethanolPrice: Double = (formatter.number(from: ethanolPrice) as? Double),
                  let gasPrice: Double = (formatter.number(from: gasPrice) as? Double) else {
                delegate?.failure()
                return
            }
            
            if ethanolPrice / gasPrice > 0.7 {
                delegate?.success(bestFuel: .gas)
            } else {
                delegate?.success(bestFuel: .ethanol)
            }
        } else {
            delegate?.failure()
        }
    }
}
