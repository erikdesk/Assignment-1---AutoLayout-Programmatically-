//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
    //
    
    let orangeView: UIView = {
        let orange = UIView()
        orange.translatesAutoresizingMaskIntoConstraints = false
        orange.backgroundColor = UIColor(red: 254/255, green: 6/255, blue: 5/255, alpha: 1)
        return orange
    }()
    
    let orangeStackView: UIStackView = {
        let orange = UIStackView()
        orange.translatesAutoresizingMaskIntoConstraints = false
        return orange
    }()
    
    let leftOrangeView: UIView = {
        let leftOrange = UIView()
        leftOrange.translatesAutoresizingMaskIntoConstraints = false
        leftOrange.backgroundColor = .orange
        return leftOrange
    }()

    let rightOrangeView: UIView = {
        let rightOrange = UIView()
        rightOrange.translatesAutoresizingMaskIntoConstraints = false
        rightOrange.backgroundColor = .orange
        return rightOrange
    }()
    
    let purpleView: UIView = {
        let purple = UIView()
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.backgroundColor = .purple
        return purple
    }()
    
    let blueStackView: UIStackView = {
        let blue = UIStackView()
        blue.translatesAutoresizingMaskIntoConstraints = false
        return blue
    }()

    let topBlueView: UIView = {
        let topBlue = UIView()
        topBlue.translatesAutoresizingMaskIntoConstraints = false
        topBlue.backgroundColor = .blue
        return topBlue
    }()

    let middleBlueView: UIView = {
        let middleBlue = UIView()
        middleBlue.translatesAutoresizingMaskIntoConstraints = false
        middleBlue.backgroundColor = .blue
        return middleBlue
    }()

    let bottomBlueView: UIView = {
        let bottomBlue = UIView()
        bottomBlue.translatesAutoresizingMaskIntoConstraints = false
        bottomBlue.backgroundColor = .blue
        return bottomBlue
    }()
    
    //
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
    
    //
    
    mainView.addSubview(orangeView)
    orangeView.addSubview(orangeStackView)
    orangeStackView.addArrangedSubview(leftOrangeView)
    orangeStackView.addArrangedSubview(rightOrangeView)
    
    NSLayoutConstraint.activate([
        orangeView.widthAnchor.constraint(equalToConstant: 220),
        orangeView.heightAnchor.constraint(equalToConstant: 80),
        orangeView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
        orangeView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15)
    ])
    
    NSLayoutConstraint.activate([
        orangeStackView.topAnchor.constraint(equalTo: orangeView.topAnchor),
        orangeStackView.bottomAnchor.constraint(equalTo: orangeView.bottomAnchor),
        orangeStackView.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor),
        orangeStackView.trailingAnchor.constraint(equalTo: orangeView.trailingAnchor)
    ])
    
    orangeStackView.spacing = 8
    orangeStackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    orangeStackView.isLayoutMarginsRelativeArrangement = true
    
    NSLayoutConstraint.activate([
        leftOrangeView.widthAnchor.constraint(equalTo: rightOrangeView.widthAnchor, multiplier: 2)
    ])
    
    mainView.addSubview(purpleView)
    NSLayoutConstraint.activate([
        purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7),
        purpleView.heightAnchor.constraint(equalToConstant: 80),
        purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),
        purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15)
    ])
    
    mainView.addSubview(blueStackView)
    blueStackView.addArrangedSubview(topBlueView)
    blueStackView.addArrangedSubview(middleBlueView)
    blueStackView.addArrangedSubview(bottomBlueView)
    
    NSLayoutConstraint.activate([
        blueStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        blueStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
        blueStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.8)
    ])
    
    blueStackView.axis = .vertical
    blueStackView.distribution = .equalSpacing
    
    NSLayoutConstraint.activate([
        topBlueView.widthAnchor.constraint(equalToConstant: 60),
        topBlueView.heightAnchor.constraint(equalToConstant: 60)
    ])
    
    NSLayoutConstraint.activate([
        middleBlueView.widthAnchor.constraint(equalToConstant: 60),
        middleBlueView.heightAnchor.constraint(equalToConstant: 60)
    ])
    
    NSLayoutConstraint.activate([
        bottomBlueView.widthAnchor.constraint(equalToConstant: 60),
        bottomBlueView.heightAnchor.constraint(equalToConstant: 60)
    ])
    
    //
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

