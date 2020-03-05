//
//  CliniciansVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 02/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class CliniciansVC: UIViewController {

    @IBOutlet var clinicianCollectionView: UIView!
    @IBOutlet weak var clinicianSearchView: UIView!
    @IBOutlet weak var clinicianSearchBar: UITextField!
    @IBOutlet weak var totalCliniciansLabel: UILabel!
    @IBOutlet weak var activeCliniciansLabel: UILabel!
    @IBOutlet weak var inactiveCliniciansLabel: UILabel!
    @IBOutlet weak var totalClinicianView: UIView!
    @IBOutlet weak var activeClinicianView: UIView!
    @IBOutlet weak var inactiveClinicianView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfCliniciansVC()
    }
}

extension CliniciansVC {
    func initialSettingoOfCliniciansVC(){
        //adding initial to clinianSearchBar(TextField)
        clinicianSearchBar.backgroundColor = .bagroundGrey
        clinicianSearchBar.leftPadding(paddingSize: 10)
        clinicianSearchBar.placeholder = Constant.searchClinianPlaceHolder.identifier
        clinicianSearchBar.makeCornerRadius(raidus: clinicianSearchBar.frame.size.height/2)
        clinicianSearchBar.font = UIFont(name: fontConstant.SFProDisplayRegular.identifier, size: 20)
        
        //adding view shadow
        clinicianSearchView.dropShadow()
        
        //search adding to cliniciansearch bar
        let searchImage = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        searchImage.contentMode = .scaleAspectFit
        searchImage.image = UIImage(named: imageConstant.Search.identifier)
        let searchImageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        searchImageContainerView.addSubview(searchImage)
        clinicianSearchBar.leftView = searchImageContainerView
        clinicianSearchBar.rightViewMode = .unlessEditing
        
        //adding color to background
        clinicianCollectionView.backgroundColor = .bagroundGrey
        
        //setting color to Clinian stack Label
        let attributeColorBlack = [NSAttributedString.Key.foregroundColor : UIColor.black]
        let attributeColorRed = [NSAttributedString.Key.foregroundColor : UIColor.systemRed]
        let attributeColorGreen = [NSAttributedString.Key.foregroundColor : UIColor.systemGreen]
        let totalClinicianString = NSAttributedString(string: Constant.TotalClinicians.identifier, attributes: attributeColorBlack)
        let activeClinicianString = NSAttributedString(string: Constant.ActiveClinicians.identifier, attributes: attributeColorBlack)
        let inActiveClinicianString = NSAttributedString(string: Constant.InactiveClicians.identifier, attributes: attributeColorBlack)
        let noOfActiveClinician = NSAttributedString(string: "100", attributes: attributeColorGreen)
        let noOfClinician = NSAttributedString(string: "100", attributes: attributeColorBlack)
        let noOfInActiveClinician = NSAttributedString(string: "100", attributes: attributeColorRed)
        var finalTotalClinianString = NSMutableAttributedString()
        finalTotalClinianString.append(noOfClinician)
        finalTotalClinianString.append(totalClinicianString)
        var finalActiveClinianString = NSMutableAttributedString()
        finalActiveClinianString.append(noOfActiveClinician)
        finalActiveClinianString.append(activeClinicianString)
        var finalInActiveClinianString = NSMutableAttributedString()
        finalInActiveClinianString.append(noOfInActiveClinician)
        finalInActiveClinianString.append(inActiveClinicianString)
        totalCliniciansLabel.attributedText = finalTotalClinianString
        inactiveCliniciansLabel.attributedText = finalInActiveClinianString
        activeCliniciansLabel.attributedText = finalActiveClinianString
    }
}
