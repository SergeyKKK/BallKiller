//
//  RulesViewController.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit
import SnapKit

final class RulesViewController: UIViewController {
  
  //MARK: - Properties
  
  private lazy var titleLabel = UILabel()
  private lazy var closeButton = UIButton()
  private lazy var roolsTextView = UITextView()
  
  private let paragraphStyle = NSMutableParagraphStyle()
  
  //MARK: - Life circle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  //MARK: - Private methods
  
  private func setupUI() {
    view.backgroundColor = .white
    
    setupTitleLabel(titleLabel)
    setupCloseButton(closeButton)
    setupRoolsTextView(roolsTextView)
  }
  
  private func setupTitleLabel(_ label: UILabel) {
    label.text = .rules
    label.font = .systemFont(ofSize: 24, weight: .medium)
    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.leading.equalTo(10)
      make.trailing.equalToSuperview()
      make.top.equalTo(20)
      make.height.equalTo(50)
    }
  }
  
  private func setupCloseButton(_ button: UIButton) {
    button.setImage(.cardClose, for: .normal)
    button.addTarget(
      self,
      action: #selector(closeCardAction),
      for: .touchUpInside
    )
    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.top.equalTo(20)
      make.trailing.equalTo(-10)
      make.height.equalTo(50)
    }
  }
  
  
  private func setupRoolsTextView(_ textView: UITextView) {
    textView.isEditable = false
    textView.showsVerticalScrollIndicator = false
    paragraphStyle.lineSpacing = 15
    let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
    let attributedString = NSAttributedString(string: .allRules, attributes: attributes)
    textView.attributedText = attributedString
    view.addSubview(textView)
    textView.snp.makeConstraints { make in
      make.leading.equalTo(10)
      make.trailing.equalTo(-10)
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.bottom.equalTo(-10)
    }
  }
  
  //MARK: - Actions
  
  @objc private func closeCardAction() {
    dismiss(animated: true)
  }
}

