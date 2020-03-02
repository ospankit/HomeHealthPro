//
//  Extension.swift
//  HomeHealthPro
//
//  Created by Ankit on 26/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

public class Extension : NSObject {
    
}

extension UIView {
    public func makeCornerRadius(raidus: CGFloat){
        DispatchQueue.main.async {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = raidus
            self.layoutIfNeeded()
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
}
