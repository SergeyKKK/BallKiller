//
//  LevelViewController.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit
import SnapKit

final class LevelViewController: UIViewController {
  
  //MARK: - Properties
  
  private lazy var titleLabel = UILabel()
  private lazy var closeButton = UIButton()
  private lazy var levelTableView = UITableView()
  
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
    setupLevelTableView(levelTableView)
  }
  
  private func setupTitleLabel(_ label: UILabel) {
    label.text = .level
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
  
  private func setupLevelTableView(_ tableView: UITableView) {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(LevelCell.self, forCellReuseIdentifier: LevelCell.identifier)
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.top.equalTo(titleLabel.snp.bottom)
    }
  }
  
  private func presentPlaygroundViewController(row: Int) {
    let playgroundViewController = PlaygroundViewController(level: GameLevel.allCases[row])
    playgroundViewController.modalPresentationStyle = .fullScreen
    present(playgroundViewController, animated: true)
  }
  
  //MARK: - Actions
  
  @objc private func closeCardAction() {
    dismiss(animated: true)
  }
}

//MARK: - Extensions

extension LevelViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    GameLevel.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: LevelCell.identifier,
      for: indexPath
    ) as? LevelCell else { return UITableViewCell() }
    cell.selectionStyle = .none
    cell.congigure(title: GameLevel.allCases[indexPath.row].rawValue)
    return cell
  }
}

extension LevelViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presentPlaygroundViewController(row: indexPath.row)
  }
}

