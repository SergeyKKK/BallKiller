//
//  LevelCell.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit
import SnapKit

final class LevelCell: UITableViewCell {
  
  //MARK: - Properties
  
  static let identifier = "LevelCell"
  
  private lazy var levelLabel = UILabel()
  
  //MARK: - Setup
  
  func congigure(title: String) {
    setupLevelLabel(text: title)
  }
  
  private func setupLevelLabel(text: String) {
    levelLabel.text = text
    levelLabel.textAlignment = .center
    contentView.addSubview(levelLabel)
    levelLabel.snp.makeConstraints { make in
      make.height.equalTo(100)
      make.edges.equalTo(contentView)
    }
  }
}

