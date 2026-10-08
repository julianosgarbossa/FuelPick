//
//  CalculatorScreen.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import UIKit

protocol CalculatorScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedCalculateButton()
}

class CalculatorScreen: UIView {
    private weak var delegate: CalculatorScreenDelegate?
    
    func delegate(delegate: CalculatorScreenDelegate) {
        self.delegate = delegate
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_blur")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back_button"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var logoAppImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_app_small")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var ethanolPriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço do álcool - Exemplo: 4,75"
        textField.textColor = .darkGray
        textField.autocorrectionType = .no
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    lazy var gasPriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço da gasolina - Exemplo: 5,70"
        textField.textColor = .darkGray
        textField.autocorrectionType = .no
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedBackButton(_ sender: UIButton) {
        delegate?.tappedBackButton()
    }
    
    @objc
    private func tappedCalculateButton(_ sender: UIButton) {
        delegate?.tappedCalculateButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        addSubview(backgroundImageView)
        addSubview(backButton)
        addSubview(logoAppImageView)
        addSubview(ethanolPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculateButton)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            ethanolPriceTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 120),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 44),
            
            gasPriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor, constant: 20),
            gasPriceTextField.leadingAnchor.constraint(equalTo: ethanolPriceTextField.leadingAnchor),
            gasPriceTextField.trailingAnchor.constraint(equalTo: ethanolPriceTextField.trailingAnchor),
            gasPriceTextField.heightAnchor.constraint(equalTo: ethanolPriceTextField.heightAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalTo: ethanolPriceTextField.heightAnchor)
        ])
    }
}
