//
//  Ball.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit

protocol BallProtocol {
  init(color: UIColor, radius: Int, coordinates: (x: Int, y: Int))
}

final class Ball: UIView, BallProtocol {
  var color = UIColor()
  required public init(
    color: UIColor,
    radius: Int,
    coordinates: (x: Int, y: Int)
  ) {
    super.init (
      frame: CGRect(
        x: coordinates.x,
        y: coordinates.y,
        width: radius * 2,
        height: radius * 2
      )
    )
    self.layer.cornerRadius = self.bounds.width / 2.0
    self.color = color
    self.backgroundColor = color
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

