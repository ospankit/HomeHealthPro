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
        
        //adding corner radius to view
        let radiusView = totalClinicianView.frame.size.height/10
        totalClinicianView.makeCornerRadius(raidus: radiusView)
        activeClinicianView.makeCornerRadius(raidus: radiusView)
        inactiveClinicianView.makeCornerRadius(raidus: radiusView)
        
        //adding view shadow
        clinicianSearchView.dropShadow()
        totalClinicianView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: -1, height: 1))
        activeClinicianView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: -1, height: 1))
        inactiveClinicianView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: -1, height: 1))
        
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
        let attributeColorBlackRegular = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont(name: fontConstant.SFProDisplayRegular.identifier, size: 11)]
        let attributeColorBlackBold = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont(name: fontConstant.SFProDisplayBold.identifier, size: 11)]
        let attributeColorRedBold = [NSAttributedString.Key.foregroundColor : UIColor.systemRed, NSAttributedString.Key.font: UIFont(name: fontConstant.SFProDisplayBold.identifier, size: 11)]
        let attributeColorGreenBold = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen, NSAttributedString.Key.font: UIFont(name: fontConstant.SFProDisplayBold.identifier, size: 11)]
        //attributeColorGreenBold[NSAttributedString.Key.foregroundColor] = UIColor.systemGreen
        //attributeColorGreenBold[NSAttributedString.Key.font] = UIFont(name: fontConstant.SFProDisplayBold.identifier, size: 17)
        let totalClinicianString = NSAttributedString(string: Constant.TotalClinicians.identifier, attributes: attributeColorBlackRegular)
        let activeClinicianString = NSAttributedString(string: Constant.ActiveClinicians.identifier, attributes: attributeColorBlackRegular)
        let inActiveClinicianString = NSAttributedString(string: Constant.InactiveClicians.identifier, attributes: attributeColorBlackRegular)
        let noOfActiveClinician = NSAttributedString(string: "100", attributes: attributeColorGreenBold)
        let noOfClinician = NSAttributedString(string: "100", attributes: attributeColorBlackBold)
        let noOfInActiveClinician = NSAttributedString(string: "100", attributes: attributeColorRedBold)
        let finalTotalClinianString = NSMutableAttributedString()
        finalTotalClinianString.append(noOfClinician)
        finalTotalClinianString.append(totalClinicianString)
        let finalActiveClinianString = NSMutableAttributedString()
        finalActiveClinianString.append(noOfActiveClinician)
        finalActiveClinianString.append(activeClinicianString)
        let finalInActiveClinianString = NSMutableAttributedString()
        finalInActiveClinianString.append(noOfInActiveClinician)
        finalInActiveClinianString.append(inActiveClinicianString)
        totalCliniciansLabel.attributedText = finalTotalClinianString
        inactiveCliniciansLabel.attributedText = finalInActiveClinianString
        activeCliniciansLabel.attributedText = finalActiveClinianString
    }
}

extension CliniciansVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Controller.ClinicianCollectionCell.identifier, for: indexPath) as! ClinicianCollectionCell
        cell.makeCornerRadius(raidus: collectionView.frame.size.height/40)
        //cell.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: 0, height: -1))
        cell.initalSetting()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/2)-4, height: (collectionView.frame.size.height/2)-8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
