//
//  FinalBillVC.swift
//  MK_hydro
//
//  Created by Moiz Khan on 10/3/19.
//  Sheridan Username: khmoiz | ID: 991474771
//  Copyright © 2019 Moiz Khan. All rights reserved.
//



import UIKit

class FinalBillVC: UIViewController {
    
    //Setup all Labels
    @IBOutlet weak var lblOnPeak: UILabel!
    @IBOutlet var lblMidPeak: UILabel!
    @IBOutlet var lblOffPeak: UILabel!
    
    @IBOutlet var lblOnPeakText: UILabel!
    @IBOutlet var lblMidPeakText: UILabel!
    @IBOutlet var lblOffPeakText: UILabel!
    
    @IBOutlet weak var lblTotalCharges: UILabel!
    @IBOutlet weak var lblHST: UILabel!
    @IBOutlet weak var lblRebate: UILabel!
    @IBOutlet weak var lblTotalDue: UILabel!
    
    //Setup all variables to hold customer usage data and calculated invoice data
    var onPeakUsage: Double = 0.0
    var midPeakUsage:Double = 0.0
    var offPeakUsage: Double = 0.0
    
    var finalOnPeak: Double = 0.0
    var finalMidPeak: Double = 0.0
    var finalOffPeak: Double = 0.0
    
    var regCharge: Double = 3.28
    var totalCharge: Double = 0.0
    var HST: Double = 0.0
    var rebate: Double = 0.0
    var totalDue: Double = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Setup the data from previous VC to reflect invoice
        lblOnPeak.text = "$" + String(self.finalOnPeak)
        lblOnPeakText.text =  String(self.onPeakUsage) + " kWh @ $0.132/kWh"
        
        lblMidPeak.text = "$" + String(self.finalMidPeak)
        lblMidPeakText.text = String(self.midPeakUsage) + " kWh @ $0.094/kWh"
        
        lblOffPeak.text = "$" + String(self.finalOffPeak)
        lblOffPeakText.text = String(self.offPeakUsage) + " kWh @ $0.065/kWh"
        
        lblTotalCharges.text = String(format:"$%.2f",self.totalCharge)
        lblHST.text =  String(format:"$%.2f",self.HST)
        lblRebate.text = String(format:"$%.2f",self.rebate)
        lblTotalDue.text =  String(format:"$%.2f",self.totalDue)
        
        
        
        
    }
    
    
    
    
    
}
