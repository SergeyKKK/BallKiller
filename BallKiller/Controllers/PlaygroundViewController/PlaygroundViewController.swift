//
//  PlaygroundViewController.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit

enum GameLevel: String, CaseIterable {
  case junior = "Начинающий"
  case middle = "Средний"
  case senior = "Профи"
}

final class PlaygroundViewController: UIViewController {
  
  //MARK: - Properties
  
  private lazy var backgroundImageView = UIImageView()
  
  private lazy var area = SquareArea()
  private lazy var navigationView = UIView()
  private lazy var backButton = UIButton()
  private lazy var counterLabel = UILabel()
  private lazy var lifesCounterLabel = UILabel()
  private lazy var ballColorView = UIView()
  
  private var level: GameLevel = .junior
  
  //MARK: - Life circle
  
  init(level: GameLevel) {
    self.level = level
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    ballColorView.layer.cornerRadius = ballColorView.frame.size.width / 2
  }
  
  //MARK: - Private methods
  
  private func setupUI() {
    setupBackgroundImageView(backgroundImageView)
    setupNavigationView(navigationView)
    setupArea(area)
    setupBackButton(backButton)
    setupCounterLabel(counterLabel)
    setupLifesCounterLabel(lifesCounterLabel)
    setupBallColorView(ballColorView)
  }
  
  private func setupBackgroundImageView(_ imageView: UIImageView) {
    imageView.image = .background
    view.addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setupNavigationView(_ navView: UIView) {
    view.addSubview(navView)
    navView.snp.makeConstraints { make in
      make.height.equalTo(50)
      make.leading.trailing.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
    }
  }
  
  private func setupBackButton(_ button: UIButton) {
    button.setImage(.back, for: .normal)
    button.addTarget(
      self,
      action: #selector(backButtonAction),
      for: .touchUpInside
    )
    navigationView.addSubview(button)
    button.snp.makeConstraints { make in
      make.width.equalTo(50)
      make.top.bottom.leading.equalTo(navigationView)
    }
  }
  
  private func setupCounterLabel(_ label: UILabel) {
    label.text = String(0)
    label.font = .systemFont(ofSize: 25)
    label.textColor = .white
    label.textAlignment = .center
    navigationView.addSubview(label)
    label.snp.makeConstraints { make in
      make.top.bottom.equalTo(navigationView)
      make.leading.equalTo(backButton.snp.trailing)
      make.width.equalTo(navigationView.snp.width).dividedBy(3)
    }
  }
  
  private func setupLifesCounterLabel(_ label: UILabel) {
    label.text = String(3)
    label.font = .systemFont(ofSize: 25)
    label.textColor = .white
    label.textAlignment = .center
    navigationView.addSubview(label)
    label.snp.makeConstraints { make in
      make.top.bottom.equalTo(navigationView)
      make.leading.equalTo(counterLabel.snp.trailing)
      make.width.equalTo(navigationView.snp.width).dividedBy(3)
    }
  }
  
  private func setupBallColorView(_ ballView: UIView) {
    ballView.layer.borderColor = UIColor.white.cgColor
    ballView.layer.borderWidth = 0.5
    ballView.backgroundColor = .random
    navigationView.addSubview(ballView)
    ballView.snp.makeConstraints { make in
      make.width.height.equalTo(25)
      make.centerY.equalTo(navigationView)
      make.trailing.equalTo(navigationView).inset(15)
    }
  }
  
  private func setupArea(_ area: SquareArea) {
    switch level {
    case .junior:
      area.setBalls(
        withColor: [ .white,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random], andRadius: 15
      )
    case .middle:
      area.setBalls(
        withColor: [ .white,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random], andRadius: 10
      )
    case .senior:
      area.setBalls(
        withColor: [ .white,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random, .random, .random, .random,
                     .random], andRadius: 7
      )
    }
    view.addSubview(area)
    area.snp.makeConstraints { make in
      make.top.equalTo(navigationView.snp.bottom)
      make.trailing.leading.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
  }
  
  //MARK: - Actions
  
  @objc private func backButtonAction() {
    dismiss(animated: true)
  }
}

