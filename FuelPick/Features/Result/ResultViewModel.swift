//
//  ResultViewModel.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import Foundation

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

final class ResultViewModel {
    private let bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
    }
    
    var resultBestFuel: String {
        return bestFuel.rawValue
    }
}
