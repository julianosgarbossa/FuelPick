//
//  ResultScreen.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import UIKit

protocol ResultScreenDelegate: AnyObject {
    func tappedCalculateAgainButton()
}

class ResultScreen: UIView {
    private weak var delegate: ResultScreenDelegate?
    
    func delegate(delegate: ResultScreenDelegate) {
        self.delegate = delegate
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_blur")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var logoAppImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_app_small")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.text = "Abasteça com:"
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 73, weight: .bold)
        return label
    }()
    
    private lazy var calculateAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateAgainButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedCalculateAgainButton(_ sender: UIButton) {
        delegate?.tappedCalculateAgainButton()
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
        addSubview(logoAppImageView)
        addSubview(sentenceLabel)
        addSubview(resultLabel)
        addSubview(calculateAgainButton)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sentenceLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 150),
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: sentenceLabel.bottomAnchor, constant: 12),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculateAgainButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateAgainButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupView(bestFuel: String) {
        resultLabel.text = bestFuel
    }
}
