//
//  ResultViewController.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import UIKit

class ResultViewController: UIViewController {
    private var screen: ResultScreen?
    private var viewModel: ResultViewModel?
    
    init(bestFuel: BestFuel) {
        viewModel = ResultViewModel(bestFuel: bestFuel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configProtocols()
    }
    
    private func configProtocols() {
        screen?.delegate(delegate: self)
    }
    
    private func configView() {
        guard let viewModel else { return }
        screen?.setupView(bestFuel: viewModel.resultBestFuel)
    }
}

extension ResultViewController: ResultScreenDelegate {
    func tappedCalculateAgainButton() {
        navigationController?.popViewController(animated: true)
    }
}
