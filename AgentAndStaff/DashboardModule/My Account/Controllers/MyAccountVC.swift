//
//  MyAccountVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 02/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController {

    @IBOutlet var myAccountBaseView: UIView!
    @IBOutlet weak var myAccountGreyView: UIView!
    @IBOutlet weak var myAccountAgencyNameLabel: UILabel!
    @IBOutlet weak var myAccountBankAddressLabel: UILabel!
    @IBOutlet weak var myAccountBankNameLabel: UILabel!
    @IBOutlet weak var myAccountSwiftCodeLabel: UILabel!
    @IBOutlet weak var myAccountRoutingNoLabel: UILabel!
    @IBOutlet weak var myAccountAccountNumberLabel: UILabel!
    @IBOutlet weak var myAccountAccountHolderNameLabel: UILabel!
    @IBOutlet weak var myAccountEmailLabel: UILabel!
    @IBOutlet weak var myAccountFaxLabel: UILabel!
    @IBOutlet weak var myAccountAddressLabel: UILabel!
    @IBOutlet weak var myAccountNameLabel: UILabel!
    @IBOutlet weak var myAccountClinicLabel: UILabel!
    @IBOutlet weak var myAccountTelephoneLabel: UILabel!
    @IBOutlet weak var myAccountReviewLabel: UILabel!
    @IBOutlet weak var myAccountGraidentVIEW: UIView!
    @IBOutlet weak var myAccountDocumentLabel: UILabel!
    @IBOutlet weak var myAccountBankDetailsLabel: UILabel!
    @IBOutlet weak var myAccountAgencyImageView: UIImageView!
    @IBOutlet weak var myAccountBankDetailsImageView: UIImageView!
    @IBOutlet weak var myAccountAccountHolderLabelFix: UILabel!
    @IBOutlet weak var myAccountAccountNoLabelFix: UILabel!
    @IBOutlet weak var myAccountRoutingNoLabelFix: UILabel!
    @IBOutlet weak var myAccountSwiftLabelFix: UILabel!
    @IBOutlet weak var myAccountBankNameLabelFix: UILabel!
    @IBOutlet weak var myAccountBankAddressLabelFix: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfMyAccountVC()
    }
}

extension MyAccountVC {
    func initialSettingoOfMyAccountVC(){
        //adding color to view
        myAccountGreyView.backgroundColor = .bagroundGrey
        myAccountGraidentVIEW.addGradientTo(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: true)
        myAccountBaseView.addGradientTo(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: true)

        
        //addding color to label
        myAccountAgencyNameLabel.textColor = .colorPrimaryDark
        myAccountBankNameLabel.textColor = .colorPrimaryDark
        myAccountBankNameLabel.textColor = .colorPrimaryDark
        myAccountSwiftCodeLabel.textColor = .colorPrimaryDark
        myAccountRoutingNoLabel.textColor = .colorPrimaryDark
        myAccountAccountNumberLabel.textColor = .colorPrimaryDark
        myAccountAccountHolderNameLabel.textColor = .colorPrimaryDark
        myAccountBankAddressLabel.textColor = .colorPrimaryDark
        myAccountDocumentLabel.textColor = .colorPrimaryDark
        myAccountBankDetailsLabel.textColor = .colorPrimaryDark
        
        myAccountEmailLabel.textColor = .fpGrey
        myAccountFaxLabel.textColor = .fpGrey
        myAccountAddressLabel.textColor = .fpGrey
        myAccountNameLabel.textColor = .fpGrey
        myAccountClinicLabel.textColor = .fpGrey
        myAccountTelephoneLabel.textColor = .fpGrey
        myAccountTelephoneLabel.textColor = .fpGrey
        myAccountReviewLabel.textColor = .fpGrey
        myAccountAccountHolderLabelFix.textColor = .fpGrey
        myAccountAccountNoLabelFix.textColor = .fpGrey
        myAccountRoutingNoLabelFix.textColor = .fpGrey
        myAccountSwiftLabelFix.textColor = .fpGrey
        myAccountBankNameLabelFix.textColor = .fpGrey
        myAccountBankAddressLabelFix.textColor = .fpGrey
        
        //imageview round
        myAccountAgencyImageView.makeCornerRadius(raidus: myAccountAgencyImageView.frame.size.height/2)
        
    }
}

extension MyAccountVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Controller.DocumentCollectionViewCell.identifier, for: indexPath) as! DocumentCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/1.7, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
