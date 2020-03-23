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
    @IBOutlet weak var cliniciansColletionView: UICollectionView!
    
    let viewModel = CliniciansViewModel()
    
    var clinicianBool : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfCliniciansVC()
        clinicianSearchBar.addTarget(self, action: #selector(searchTextFieldTextChanged), for: .editingChanged)
        viewModel.delegate = self
        let cilniciansListRequest = ClinicianListRequest(Gender: "", SortCol: "", SearchKey: "", PatientTypeId: 0, CategoryId: 0, LanguageId: 0, Start: 0, PageSize: NumberConstant.pageSize.identifier, Active: nil)
        viewModel.getInitialClinicianData(param: cilniciansListRequest)
    }
    
    @objc func inActiveClinicianTapAction(sender:UITapGestureRecognizer) {
        self.viewModel.cliniciansResponseData = nil
        self.viewModel.cliniciansData = []
        self.clinicianBool = false
        let inActiveClinicainListRequest = ClinicianListRequest(Gender: "", SortCol: "", SearchKey: "", PatientTypeId: 0, CategoryId: 0, LanguageId: 0, Start: 0, PageSize: NumberConstant.pageSize.identifier, Active: self.clinicianBool)
        viewModel.getInitialClinicianData(param: inActiveClinicainListRequest)
    }
    @objc func activeClinicianTapAction(sender:UITapGestureRecognizer) {
        self.viewModel.cliniciansResponseData = nil
        self.viewModel.cliniciansData = []
        self.clinicianBool = true
        let activeClinicainListRequest = ClinicianListRequest(Gender: "", SortCol: "", SearchKey: "", PatientTypeId: 0, CategoryId: 0, LanguageId: 0, Start: 0, PageSize: NumberConstant.pageSize.identifier, Active: self.clinicianBool)
        viewModel.getInitialClinicianData(param: activeClinicainListRequest)
    }
    @objc func totalClinicianTapAction(sender:UITapGestureRecognizer) {
        self.viewModel.cliniciansResponseData = nil
        self.viewModel.cliniciansData = []
        self.clinicianBool = nil
        let totalActiveClinicainListRequest = ClinicianListRequest(Gender: "", SortCol: "", SearchKey: "", PatientTypeId: 0, CategoryId: 0, LanguageId: 0, Start: 0, PageSize: NumberConstant.pageSize.identifier, Active: self.clinicianBool)
        viewModel.getInitialClinicianData(param: totalActiveClinicainListRequest)
    }
    
    @objc func searchTextFieldTextChanged(){
        let searchText = clinicianSearchBar.text
        viewModel.cliniciansResponseData = nil
        viewModel.cliniciansData = []
        let searchRequest = ClinicianListRequest(Gender: "", SortCol: "", SearchKey: searchText!, PatientTypeId: 0, CategoryId: 0, LanguageId: 0, Start: 0, PageSize: NumberConstant.pageSize.identifier, Active: self.clinicianBool)
        viewModel.getInitialClinicianData(param: searchRequest)
    }
    
    @IBAction func searchClinician(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: Controller.SearchVC.identifier) as! SearchVC
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    
}


extension CliniciansVC {
    func initialSettingoOfCliniciansVC(){
        //adding gesture
        let inActiveClinicainViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.inActiveClinicianTapAction(sender:)))
        let activeClinicainViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.activeClinicianTapAction(sender:)))
        let totalActiveClinicainViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.totalClinicianTapAction(sender:)))
        self.totalClinicianView.addGestureRecognizer(totalActiveClinicainViewTapGesture)
        self.activeClinicianView.addGestureRecognizer(activeClinicainViewTapGesture)
        self.inactiveClinicianView.addGestureRecognizer(inActiveClinicainViewTapGesture)
        
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
        totalClinicianView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: 1, height: 1))
        activeClinicianView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: 1, height: 1))
        inactiveClinicianView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: 1, height: 1))
        
        //search adding to cliniciansearch bar
        clinicianSearchBar.addBorder(width: 0.5)
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
        let noOfActiveClinician = NSAttributedString(string: "0", attributes: attributeColorGreenBold)
        let noOfClinician = NSAttributedString(string: "0", attributes: attributeColorBlackBold)
        let noOfInActiveClinician = NSAttributedString(string: "0", attributes: attributeColorRedBold)
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
        return viewModel.cliniciansData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Controller.ClinicianCollectionCell.identifier, for: indexPath) as! ClinicianCollectionCell
        cell.makeCornerRadius(raidus: collectionView.frame.size.height/40)
        //cell.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: 0.5, height: 1))
        cell.initalSetting()
        if viewModel.cliniciansData != nil {
            cell.setData(data: (viewModel.cliniciansData[indexPath.row]))
        }
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.cliniciansData.count != 1 {
            if indexPath.item == viewModel.cliniciansData.count-1{
                if viewModel.cliniciansData.count < (viewModel.cliniciansResponseData?.recordsTotal)!-1 {
                    var pageSize = 10
                    if UIDevice.current.userInterfaceIdiom == .pad {pageSize = 15}
                    if pageSize + viewModel.cliniciansData.count > (viewModel.cliniciansResponseData?.recordsTotal)! {pageSize = (viewModel.cliniciansResponseData?.recordsTotal)! - viewModel.cliniciansData.count}
                    let cilniciansListRequest = ClinicianListRequest(Gender: "", SortCol: "", SearchKey: "", PatientTypeId: 0, CategoryId: 0, LanguageId: 0, Start: viewModel.cliniciansData.count, PageSize: pageSize, Active: self.clinicianBool)
                    viewModel.getInitialClinicianData(param: cilniciansListRequest)
                }
            }
        }
    }
}

extension CliniciansVC : CliniciansViewModelProtocol {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showIndicator(view: self)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.hideActivity()
        }
    }
    
    func showMessage(message: String) {
        DispatchQueue.main.async {
            Alert.sharedInstance.alertOkView(viewController: self, message: message)
        }
    }
    
    func responseCliniciansData() {
        //setting clinician active, inactive and total depend on data
        DispatchQueue.main.async {
            let attributeColorBlackRegular = [NSAttributedString.Key.foregroundColor : UIColor.black]
            let attributeColorBlackBold = [NSAttributedString.Key.foregroundColor : UIColor.black]
            let attributeColorRedBold = [NSAttributedString.Key.foregroundColor : UIColor.systemRed]
            let attributeColorGreenBold = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
            let totalClinicianString = NSAttributedString(string: Constant.TotalClinicians.identifier, attributes: attributeColorBlackRegular)
            let activeClinicianString = NSAttributedString(string: Constant.ActiveClinicians.identifier, attributes: attributeColorBlackRegular)
            let inActiveClinicianString = NSAttributedString(string: Constant.InactiveClicians.identifier, attributes: attributeColorBlackRegular)
            let noOfActiveClinician = NSAttributedString(string: "\((self.viewModel.cliniciansResponseData?.listCounts.totalActive)!)", attributes: attributeColorGreenBold)
            let noOfClinician = NSAttributedString(string: "\((self.viewModel.cliniciansResponseData?.listCounts.total)!)", attributes: attributeColorBlackBold)
            let noOfInActiveClinician = NSAttributedString(string: "\((self.viewModel.cliniciansResponseData?.listCounts.totalInActive)!)", attributes: attributeColorRedBold)
            let finalTotalClinianString = NSMutableAttributedString()
            finalTotalClinianString.append(noOfClinician)
            finalTotalClinianString.append(totalClinicianString)
            let finalActiveClinianString = NSMutableAttributedString()
            finalActiveClinianString.append(noOfActiveClinician)
            finalActiveClinianString.append(activeClinicianString)
            let finalInActiveClinianString = NSMutableAttributedString()
            finalInActiveClinianString.append(noOfInActiveClinician)
            finalInActiveClinianString.append(inActiveClinicianString)
            self.totalCliniciansLabel.attributedText = finalTotalClinianString
            self.inactiveCliniciansLabel.attributedText = finalInActiveClinianString
            self.activeCliniciansLabel.attributedText = finalActiveClinianString
            
            self.cliniciansColletionView.reloadData()
        }
    }
}

extension CliniciansVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
