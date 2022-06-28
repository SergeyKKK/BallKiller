//
//  RulesViewController.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit

final class RulesViewController: UIViewController {
  
  //MARK: - Properties
  
  private lazy var titleLabel = UILabel()
  private lazy var roolsTextView = UITextView()
  
  //MARK: - Life circle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  //MARK: - Private methods
  
  private func setupUI() {
    view.backgroundColor = .white
    
    setupTitleLabel(titleLabel)
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
  
  private func setupRoolsTextView(_ textView: UITextView) {
    textView.text = .allRules
    textView.font = .systemFont(ofSize: 15, weight: .semibold)
    textView.isEditable = false
    textView.showsVerticalScrollIndicator = false
    view.addSubview(textView)
    textView.snp.makeConstraints { make in
      make.leading.equalTo(10)
      make.trailing.equalTo(-10)
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.bottom.equalTo(-10)
    }
  }
}

