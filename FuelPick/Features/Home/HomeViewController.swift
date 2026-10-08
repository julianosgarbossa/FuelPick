//
//  HomeViewController.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import UIKit

class HomeViewController: UIViewController {
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configProtocols() {
        screen?.delegate(delegate: self)
    }
}

extension HomeViewController: HomeScreenDelegate {
    func tappedStartButton() {
        print(#function)
    }
}
