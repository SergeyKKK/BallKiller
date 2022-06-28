//
//  MenuViewController.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 27.06.2022.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
  
  //MARK: - Properties
  
  private lazy var backgroundImageView = UIImageView()
  private lazy var startButton = UIButton()
  private lazy var rulesButton = UIButton()
  
  //MARK: - Life circle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  //MARK: - Private methods
  
  private func setupUI() {
    setupBackgroundImageView(backgroundImageView)
    setupStartButton(startButton)
    setupRulesButton(rulesButton)
  }
  
  private func setupBackgroundImageView(_ imageView: UIImageView) {
    imageView.image = .background
    view.addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setupStartButton(_ button: UIButton) {
    button.setTitle(.start, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.addTarget(
      self,
      action: #selector(startPlayAction),
      for: .touchUpInside
    )
    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.height.equalTo(30)
    }
  }
  
  private func setupRulesButton(_ button: UIButton) {
    button.setTitle(.rules, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
    button.setTitleColor(.lightGray, for: .normal)
    button.addTarget(
      self,
      action: #selector(showRulesAction),
      for: .touchUpInside
    )
    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.bottom.equalTo(-50)
      make.centerX.equalToSuperview()
      make.height.equalTo(50)
    }
  }
  
  //MARK: - Actions
  
  @objc private func startPlayAction() {
    let levelViewController = LevelViewController()
    levelViewController.modalPresentationStyle = .custom
    levelViewController.transitioningDelegate = self
    present(levelViewController, animated: true)
  }
  
  @objc private func showRulesAction() {
    let rulesViewController = RulesViewController()
    rulesViewController.modalPresentationStyle = .custom
    rulesViewController.transitioningDelegate = self
    present(rulesViewController, animated: true)
  }
}

//MARK: - Extension

extension MenuViewController: UIViewControllerTransitioningDelegate {
  func presentationController(
    forPresented presented: UIViewController,
    presenting: UIViewController?,
    source: UIViewController
  ) -> UIPresentationController? {
    PresentationController(presentedViewController: presented, presenting: presenting)
  }
}

