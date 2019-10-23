//
//  CustomerData.swift
//  MK_hydro
//
//  Created by Moiz Khan on 10/3/19.
//  Sheridan Username : khmoiz | ID : 991474771
//  Copyright © 2019 Moiz Khan. All rights reserved.
//

import UIKit

class CustomerData: UIViewController {
    
    //Declare and setup the view objects to be accessed as variables
    @IBOutlet var txtEmailAddress: UITextField!
    @IBOutlet var txtPhoneNumber: UITextField!
    @IBOutlet var txtOnPeak: UITextField!
    @IBOutlet weak var txtMidPeak: UITextField!
    @IBOutlet var txtOffPeak: UITextField!
    
    //Setup Strings to store Customer Email & Phone Number; Double to store Usage data
    var email: String = ""
    var phone: String = ""
    var onPeakUsage: Double = 0.0
    var midPeakUsage:Double =  0.0
    var offPeakUsage: Double =  0.0
    
    var finalOnPeak: Double = 0.0
    var finalMidPeak: Double = 0.0
    var finalOffPeak: Double = 0.0
    
    var regCharge: Double = 0.0
    var totalCharge: Double = 0.0
    var HST: Double = 0.0
    var rebate: Double = 0.0
    var totalDue: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDoneClick(_ sender: Any) {
        //OnDoneClick is attached to the 'Calculate Hydro' Button, it uses a function called openBillScene()
        // -to navigate to the next View Controller after having calculated the usage total and final invoice details.
        
        email = txtEmailAddress.text ?? ""
        phone = txtPhoneNumber.text ?? ""
        onPeakUsage = Double(txtOnPeak.text!) ?? 0.0
        midPeakUsage = Double(txtMidPeak.text!) ?? 0.0
        offPeakUsage = Double(txtOffPeak.text!) ?? 0.0
        
        finalOnPeak = onPeakUsage * 0.132
        finalMidPeak = midPeakUsage * 0.065
        finalOffPeak = offPeakUsage * 0.094
        
        regCharge = 3.28
        totalCharge = finalOnPeak + finalMidPeak + finalOffPeak + regCharge
        
        HST = (totalCharge * 0.13)
        rebate = totalCharge * 0.08
        totalDue = totalCharge + HST - rebate
        
        //Navigate to the next View Controller
        openBillScene()
        
    }
    
    func openBillScene(){
        //This function is used to save the data and pass it onto the next View Controller
        //Once the data is saved we navigate to the next View Controller
        
        
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let billVC = mainSB.instantiateViewController(withIdentifier: "BillScene") as! FinalBillVC
        
        //Share the usage and invoice data with the next View Controller
        billVC.onPeakUsage = self.onPeakUsage
        billVC.midPeakUsage = self.midPeakUsage
        billVC.offPeakUsage = self.offPeakUsage
        billVC.finalOnPeak = self.finalOnPeak
        billVC.finalMidPeak = self.finalMidPeak
        billVC.finalOffPeak = self.finalOffPeak
        billVC.totalCharge = self.totalCharge
        billVC.HST = self.HST
        billVC.rebate = self.rebate
        billVC.totalDue = self.totalDue
        
        //Navigate to next screen
        navigationController?.pushViewController(billVC, animated: true)
    }
    
}
