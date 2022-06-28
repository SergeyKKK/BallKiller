//
//  SquareArea.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 28.06.2022.
//

import UIKit

protocol SquareAreaProtocol {
  func setBalls(withColor: [UIColor], andRadius: Int)
}

final class SquareArea: UIView, SquareAreaProtocol {
  
  private var balls: [Ball] = []
  private var animator: UIDynamicAnimator?
  private var snapBehavior: UISnapBehavior?
  private var collisionBehavior: UICollisionBehavior
 
  override init(frame: CGRect) {
    collisionBehavior = UICollisionBehavior(items: [])
    super.init(frame: frame)
    collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
    animator = UIDynamicAnimator(referenceView: self)
    animator?.addBehavior(collisionBehavior)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func setBalls(withColor ballsColor: [UIColor], andRadius radius: Int) {
    for (index, oneBallColor) in ballsColor.enumerated() {
      let coordinateX = 10 + (2 * radius) * index
      let coordinateY = 10 + (2 * radius) * index
      let ball = Ball(color: oneBallColor, radius: radius, coordinates: (x: coordinateX, y: coordinateY))
      self.addSubview(ball)
      self.balls.append(ball)
      collisionBehavior.addItem(ball)
    }
  }
  override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      let touchLocation = touch.location(in: self)
      for ball in balls {
        if (ball.frame.contains(touchLocation)) {
          snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
          snapBehavior?.damping = 0.5
          animator?.addBehavior(snapBehavior!)
        }
      }
    }
  }
  
  override public func touchesMoved (_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      let touchLocation = touch.location (in: self)
      if let snapBehavior = snapBehavior {
        snapBehavior.snapPoint = touchLocation
      }
    }
  }
  
  public override func touchesEnded (_ touches: Set<UITouch>, with event: UIEvent?) {
    if let snapBehavior = snapBehavior {
      animator?.removeBehavior(snapBehavior)
    }
    snapBehavior = nil
  }
}

