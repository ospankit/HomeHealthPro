//
//  AssignedPatients.swift
//  HomeHealthPro
//
//  Created by Ankit on 09/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class AssignedPatients: UIViewController {

    @IBOutlet weak var patientsDetailsTableView: UITableView!
    @IBOutlet weak var tableBackGroundView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var patientsTitleLabel: UILabel!
    @IBOutlet weak var patientsSearchTextField: UITextField!
    
    let viewModel = AssignedPatientsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfAssignedPatients()
        viewModel.delegate = self
        viewModel.getPatinetData()
        // Do any additional setup after loading the view.
    }

    @IBAction func backNavigation(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension AssignedPatients {
    func initialSettingOfAssignedPatients() {
        //patientsDetailsTableView clearClear
        patientsDetailsTableView.backgroundColor = .clear
        
        //adding label color
        patientsTitleLabel.textColor = .colorPrimaryDark
        
        //patientsSearchTextField backgroundcolor
        patientsSearchTextField.backgroundColor = .bagroundGrey
        
        //tableBackGroundView backGround color
        tableBackGroundView.backgroundColor = .bagroundGrey
        
        //searchView shadow
        searchView.dropShadow()
        
        //patientsSearchTextField corner
        patientsSearchTextField.makeCornerRadius(raidus: patientsSearchTextField.frame.size.height/2)
        
        //patientsSearchTextField font
        patientsSearchTextField.font = UIFont(name: fontConstant.SFProDisplayRegular.identifier, size: 20)
        
        //patientsSearchTextField search imageView
        patientsSearchTextField.addBorder(width: 0.5)
        patientsSearchTextField.leftPadding(paddingSize: 10)
        let searchImage = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        searchImage.contentMode = .scaleAspectFit
        searchImage.image = UIImage(named: imageConstant.Search.identifier)
        let searchImageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        searchImageContainerView.addSubview(searchImage)
        patientsSearchTextField.leftView = searchImageContainerView
        patientsSearchTextField.rightViewMode = .unlessEditing
    }
}

extension AssignedPatients: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.patientResponseData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Controller.PatientsDetailsTableCell.identifier) as! PatientsDetailsTableCell
        cell.initialSettingOfPatientsDetailsTableCell()
        if viewModel.patientResponseData?.data != nil {
            cell.setData(data: (viewModel.patientResponseData?.data[indexPath.row])!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension AssignedPatients : AssignedPatientsViewModelProtocol {
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
    
    func patientDetailsSucess() {
        DispatchQueue.main.async {
            self.patientsDetailsTableView.reloadData()
        }
    }
    
}
