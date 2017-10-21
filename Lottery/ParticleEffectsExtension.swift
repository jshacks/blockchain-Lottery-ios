
//
//  ParticleEffectsExtension.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit

extension UIViewController{
    fileprivate  enum Images {
        static let box = UIImage(named: "Box")!
        static let triangle = UIImage(named: "Triangle")!
        static let circle = UIImage(named: "Circle")!
        static let swirl = UIImage(named: "Spiral")!

    }

    fileprivate var colors: [UIColor]{
        get{
            return [
                UIColor(red: 1.0, green: 0.0, blue: 77.0/255.0, alpha: 1.0),
                UIColor.blue,
                UIColor(red: 35.0/255.0 , green: 233/255, blue: 173/255.0, alpha: 1.0),
                UIColor(red: 1, green: 209/255, blue: 77.0/255.0, alpha: 1.0)
            ]
        }
    }

    fileprivate var velocities:[Int]{
        get{
            return [
                100,
                90,
                150,
                200
            ]
        }
    }

    fileprivate var images:[UIImage] {get{
        return [
            Images.box,
            Images.triangle,
            Images.circle,
            Images.swirl
        ]
        }
    }

    func particlesAt(position: CGPoint){
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = position
        emitter.emitterShape = kCAEmitterLayerVolume
        emitter.emitterSize = CGSize(width: self.view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()

        self.view.layer.addSublayer(emitter)
    }

    private func generateEmitterCells() -> [CAEmitterCell] {
        var cells:[CAEmitterCell] = [CAEmitterCell]()
        for index in 0..<16 {
            let cell = CAEmitterCell()
            cell.birthRate = 4.0
            cell.lifetime = 14.0
            cell.lifetimeRange = 0
            cell.velocity = CGFloat(velocities[Int(arc4random_uniform(4))])
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat(Double.pi / 2)
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 0

            cell.color = getNextColor(i: index)
            cell.scaleRange = 0.25
            cell.scale = 0.1
            cell.contents = images[index % 4].cgImage
            cells.append(cell)
        }
        return cells
    }

    private func getNextColor(i:Int) -> CGColor {
        if i <= 4 {
            return colors[0].cgColor
        } else if i <= 8 {
            return colors[1].cgColor
        } else if i <= 12 {
            return colors[2].cgColor
        } else {
            return colors[3].cgColor
        }
    }
}

