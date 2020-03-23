//
//  SearchVC.swift
//  HomeHealthPro
//
//  Created by ankit shelar on 22/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit
import DropDown

class SearchVC: UIViewController {

    @IBOutlet weak var sortBySearchLabel: UILabel!
    @IBOutlet weak var sortBySearchButton: UIButton!
    @IBOutlet weak var cagetgorySearchLabel: UILabel!
    @IBOutlet weak var categorySearchButton: UIButton!
    @IBOutlet weak var langaugeSearchLabel: UILabel!
    @IBOutlet weak var langaugeSearchButton: UIButton!
    @IBOutlet weak var genderSearchTextField: UITextField!
    @IBOutlet weak var genderSearchLabel: UILabel!
    @IBOutlet weak var genderSearchButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func genderSearchPressed(_ sender: UIButton) {
    }
    
    @IBAction func langaugeSearchPressed(_ sender: UIButton) {
    }
    
    @IBAction func categorySearchPressed(_ sender: UIButton) {
    }
    
    @IBAction func sortSearchPressed(_ sender: UIButton) {
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
    
}

extension SearchVC {
    func initialSetting() {
        //setting label color
        genderSearchLabel.textColor = .fpGrey
        langaugeSearchLabel.textColor = .fpGrey
        cagetgorySearchLabel.textColor = .fpGrey
        sortBySearchLabel.textColor = .fpGrey
        
        //button cornerRadius and radius color
        
        sortBySearchButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        categorySearchButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        langaugeSearchButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        //genderSearchButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        genderSearchButton.addBorder(width: 2)
        genderSearchButton.makeCornerRadius(raidus: genderSearchButton.frame.size.height/2)
        
        searchButton.makeCornerRadius(raidus: searchButton.frame.size.height/2)
        searchButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        resetButton.tintColor = .colorPrimaryDark
        
    }
}
