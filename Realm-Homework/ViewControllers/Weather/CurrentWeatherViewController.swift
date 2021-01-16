//
//  CurrentWeatherViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 16.01.2021.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    let currentTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Chalkduster", size: 100)
        label.textColor = .red
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.text = "0"
        return label
    }()
    let forecastButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Forecast", for: .normal)
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 25)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.1
        button.addTarget(self, action: #selector(goForecastButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var shadowButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 22
        view.addSubview(forecastButton)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(currentTempLabel)
        view.addSubview(shadowButtonView)
        
        getCurrentTempFromUserDefaults()
        getCurrentTemp()
        
        self.title = "Current weather"
        
        //constraints
        setShadowButtonViewConstraints()
        setCurrentTempLabelConstraints()
    }
    
    private func getCurrentTemp() {
        Network.shared.getCurrentWeather { temp in
            self.currentTempLabel.text = "\(temp)"
            Persistance.shared.currentTemp = "\(temp)"
        }
    }
    private func getCurrentTempFromUserDefaults() {
        self.currentTempLabel.text = Persistance.shared.currentTemp
    }
    
    //MARK: Constraints
    private func setShadowButtonViewConstraints() {
        shadowButtonView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        shadowButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        shadowButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shadowButtonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        
        forecastButton.topAnchor.constraint(equalTo: shadowButtonView.topAnchor).isActive = true
        forecastButton.leftAnchor.constraint(equalTo: shadowButtonView.leftAnchor).isActive = true
        forecastButton.rightAnchor.constraint(equalTo: shadowButtonView.rightAnchor).isActive = true
        forecastButton.bottomAnchor.constraint(equalTo: shadowButtonView.bottomAnchor).isActive = true
    }
    private func setCurrentTempLabelConstraints() {
        currentTempLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        currentTempLabel.bottomAnchor.constraint(equalTo: shadowButtonView.topAnchor, constant: -20).isActive = true
        currentTempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currentTempLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }
    
    //MARK: Actions
    @objc private func goForecastButton(_ sender: UIButton) {
        navigationController?.pushViewController(ForecastViewController(), animated: true)
    }
}
