//
//  ViewController.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 27.06.2022.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
  
  //MARK: - Properties
  
  private lazy var welcomeImageView = UIImageView()
  
  //MARK: - Life circle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupWelcomeImageView(welcomeImageView)
  }
  
  //MARK: - Private methods
  
  private func setupWelcomeImageView(_ imageView: UIImageView) {
    imageView.image = .welcome
    imageView.contentMode = .scaleAspectFill
    view.addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    showMenuViewController()
  }
  
  private func showMenuViewController() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      let menuViewController = MenuViewController()
      menuViewController.modalPresentationStyle = .fullScreen
      self.present(menuViewController, animated: true)
    }
  }
}

