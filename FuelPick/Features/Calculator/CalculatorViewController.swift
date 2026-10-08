//
//  CalculatorViewController.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var screen: CalculatorScreen?
    private let viewModel: CalculatorViewModel = CalculatorViewModel()
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
        hideKeyboardWhenTappedAround()
    }
    
    private func configProtocols() {
        screen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension CalculatorViewController: CalculatorScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedCalculateButton() {
        guard let ethanolPrice = screen?.ethanolPriceTextField.text,
              let gasPrice = screen?.gasPriceTextField.text else {
            showAlert(title: "Atenção", message: "Preencha os campos do preço do álcool e da gasolina corretamente.")
            return
        }
        viewModel.calculate(ethanolPrice: ethanolPrice, gasPrice: gasPrice)
    }
}

extension CalculatorViewController: CalculatorViewModelDelegate {
    func success(bestFuel: BestFuel) {
        let resultViewController = ResultViewController(bestFuel: bestFuel)
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    func failure() {
        showAlert(title: "Atenção", message: "Preencha os campos do preço do álcool e da gasolina corretamente.")
    }
}
