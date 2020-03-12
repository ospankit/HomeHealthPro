//
//  Extension.swift
//  HomeHealthPro
//
//  Created by Ankit on 26/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation
import UIKit

public class Extension : NSObject {
    
}

extension UIView {
    func makeCornerRadius(raidus: CGFloat){
        DispatchQueue.main.async {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = raidus
            
            self.layoutIfNeeded()
        }
    }
    
    func makeTopCornerRadius(raidus: CGFloat){
        DispatchQueue.main.async {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = raidus
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            self.layoutIfNeeded()
        }
    }
    
    func addGradientTo(startColor colorOne: UIColor, endColor colorTwo: UIColor, isVertical verticalFlag: Bool) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        
        if !verticalFlag
        {
            gradient.startPoint = CGPoint.zero
            gradient.endPoint = CGPoint(x: 1, y: 0)
        }
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    func addBorder(width: CGFloat){
        DispatchQueue.main.async {
            self.layer.borderWidth = width
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.layoutIfNeeded()
        }
    }
    
    func addBorderWithCircleColor(width: CGFloat){
        DispatchQueue.main.async {
            self.layer.borderWidth = width
            self.layer.borderColor = UIColor.circleColor.cgColor
            self.layoutIfNeeded()
        }
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:3)
    }
    
    func dropShadowAllSide(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius

      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIButton {
    func addGradientToButton(startColor colorOne: UIColor, endColor colorTwo: UIColor, isVertical verticalFlag: Bool) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        
        if !verticalFlag
        {
            gradient.startPoint = CGPoint.zero
            gradient.endPoint = CGPoint(x: 1, y: 0)
        }
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    func addBorderWithGraigent(startColor colorOne: UIColor, endColor colorTwo: UIColor){
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.height/2
            self.clipsToBounds = true
            
            let gradient = CAGradientLayer()
            gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
            gradient.colors = [colorOne.cgColor, colorTwo.cgColor]

            let shape = CAShapeLayer()
            shape.lineWidth = 4
            shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            gradient.mask = shape

            self.layer.addSublayer(gradient)
        }
    }
}

extension UIColor {
    class var colorPrimaryDark:UIColor {
        get{
            return UIColor(red: 19.0/255.0, green: 46.0/255.0, blue: 106.0/255.0, alpha: 1.0)
        }
    }
    
    class var colorPrimary:UIColor {
        get {
            return UIColor(red: 94.0/255.0, green: 58.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        }
    }
    
    class var startGradientColor:UIColor {
        get {
            return UIColor(red: 101.0/255.0, green: 78.0/255.0, blue: 191.0/255.0, alpha: 1.0)
        }
    }
    
    class var endGradientColor:UIColor {
        get {
            return UIColor(red: 102.0/255.0, green: 51.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        }
    }
    
    class var bagroundGrey:UIColor {
        get {
            return UIColor(red: 243.0/255.0, green: 244.0/255.0, blue: 248.0/255.0, alpha: 1.0)
        }
    }
    
    class var fpGrey:UIColor {
        get {
            return UIColor(red: 90.0/255.0, green: 95.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        }
    }
    
    class var lineSeperator:UIColor {
        get {
            return UIColor(red: 240.0/255.0, green: 242.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        }
    }
    
    class var circleColor:UIColor {
        get {
            return UIColor(red: 226/255.0, green: 228/255.0, blue: 241/255.0, alpha: 1.0)
        }
    }
    
}

extension UITextField {
    func leftPadding(paddingSize:Int){
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: paddingSize, height: Int(self.frame.height)))
        self.leftViewMode = .always
    }
}


