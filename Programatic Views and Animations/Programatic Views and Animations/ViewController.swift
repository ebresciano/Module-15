//
//  ViewController.swift
//  Programatic Views and Animations
//
//  Created by Eva Marie Bresciano on 5/30/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topLeftButton = UIButton()
    
    let topRightButton = UIButton()
    
    let bottomLeftButton = UIButton()
    
    let bottomRightButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupConstraints()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupButtons() {
        // Set Colors
        topLeftButton.backgroundColor = .greenColor()
        topRightButton.backgroundColor = .yellowColor()
        bottomLeftButton.backgroundColor = UIColor(red: 184/255, green: 82/255, blue: 58/255.0, alpha: 1.0)
        bottomRightButton.backgroundColor = UIColor(red: 0.537, green: 0.506, blue: 0.925, alpha: 1.0)
        
        // Add Targets for Color Animation
        topLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        topRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        
        // Add Target for Shake Animation
        topLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        topRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        bottomLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        bottomRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        
        // Add Buttons
        view.addSubview(topLeftButton)
        view.addSubview(topRightButton)
        view.addSubview(bottomLeftButton)
        view.addSubview(bottomRightButton)
    }
    
    func buttonTapped() {
        let topLeftColor = topLeftButton.backgroundColor
        let topRightColor = topRightButton.backgroundColor
        let bottomLeftColor = bottomLeftButton.backgroundColor
        let bottomRightColor = bottomRightButton.backgroundColor
        
        UIView.animateWithDuration(0.5) {
        
        self.topLeftButton.backgroundColor = bottomLeftColor
        self.topRightButton.backgroundColor = topLeftColor
        self.bottomRightButton.backgroundColor = topRightColor
        self.bottomLeftButton.backgroundColor = bottomRightColor
         
         }
        }
    
    func buttonExited(sender: UIButton) {
        view.bringSubviewToFront(sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 - 15, sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 + 15, sender.frame.origin.x + sender.frame.width/2]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.30
        animation.repeatCount = 5.0
        sender.layer.addAnimation(animation, forKey: "shake")
        
    }
    
    func setupConstraints() {
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Height and Width
        
        let topButtonWidths = NSLayoutConstraint(item: topLeftButton, attribute: .Width, relatedBy: .Equal, toItem: topRightButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let topButtonHeights = NSLayoutConstraint(item: topLeftButton, attribute: .Height, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Height, multiplier: 1.0, constant: 0)
        let bottomButtonWidths = NSLayoutConstraint(item: bottomLeftButton, attribute: .Width, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let bottomButtonHeights = NSLayoutConstraint(item: bottomLeftButton, attribute: .Height, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Height, multiplier: 1.0, constant: 0)
    
        view.addConstraints([topButtonWidths, topButtonHeights, bottomButtonWidths, bottomButtonHeights])
        
        // topLeft set TOP and LEADING Constraints
        let topLeftLeadingConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let topLeftTopConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        
        // topLeft set TRAILING to topLeft LEADING
        let topLeftToTopRightContraint = NSLayoutConstraint(item: topLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: topRightButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        // topLeft botom constraint
        let topLeftBottomToBottomLeft = NSLayoutConstraint(item: topLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomLeftButton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        // topRight top and trailing 
        let topRightTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        
        let topRightTrailingConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        // bottomLeft leading and bottom
        let bottomLeftLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let bottomLeftBottom = NSLayoutConstraint(item: bottomLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        // bottomLeft Trailing to bottomRight Leading
        let bottomLeftTrailingToBottomRightLeading = NSLayoutConstraint(item: bottomLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        // topRightBottom to bottomRightTop
        let topRightToBottomRightTop = NSLayoutConstraint(item: topRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        // bottomRight Bottom and Trailing Constraints
        let bottomRightBottom = NSLayoutConstraint(item: bottomRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let bottomRightTrailing = NSLayoutConstraint(item: bottomRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        view.addConstraints([topLeftLeadingConstraint, topLeftTopConstraint, topLeftToTopRightContraint, topLeftBottomToBottomLeft, topRightTopConstraint, topRightTrailingConstraint, bottomLeftLeadingConstraint, bottomLeftBottom, bottomLeftTrailingToBottomRightLeading, topRightToBottomRightTop, bottomRightBottom, bottomRightTrailing])
    }
    
}



