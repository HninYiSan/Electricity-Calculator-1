//
//  ViewController.swift
//  Electricity Calculator
//
//  Created by Hnin Yi on 9/23/19.
//  Copyright © 2019 Hnin Yi San. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var unitamtTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var serviceLabel: UILabel!
    var unitRates = [30,50,75,100,150,200,201]
    var unitPrices = [35,50,70,90,110,120,125]
    var finalamount = 0
    var calamount = 0
    var service = 500
    
    @IBAction func Refresh(_ sender: UIButton) {
        unitamtTextField.text = ""
        resultLabel.text = "Total Amounts:"
        finalamount = 0
        calamount = 0
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        calamount = Int(unitamtTextField.text!) ?? 0
      print(calamount)
        var countunit:Int = 0
        var extraunit:Int = 0
        let lastval:Int = unitRates.last as! Int
        for a in unitRates {
            if calamount > a {
                  countunit += 1
                }
           else {
                 break
            }
        }
        print(countunit)
        for i in 0 ..< (countunit + 1) {
            if i == 0 {
                finalamount = unitPrices[i] * unitRates[i]
            }
            else if i == countunit {
                if(calamount > lastval)
                {
                print(unitPrices[i-1],extraunit)
                finalamount += unitPrices[i-1] * (calamount - lastval)
                }
                else {
                    finalamount += unitPrices[i] * (calamount - unitRates[i-1])
                }
            }
            else if i > 0 {
                finalamount += unitPrices[i] * (unitRates[i] - unitRates[i-1])
            }
        }
        finalamount += service
        resultLabel.text = "Total Amounts: " + String(finalamount)
    }
    
    @IBAction func tagView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitPrices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unitcell", for: indexPath) as? UnitDataTableViewCell
        if indexPath.row == 0 {
            cell?.unitrateLabel.text = "0-\(unitRates[indexPath.row]) units"
            let a = unitPrices[indexPath.row] * unitRates[indexPath.row]
            cell?.eachamtLabel.text = "\(a) Ks"
        }
        else if indexPath.row == (unitRates.count - 1) {
            cell?.unitrateLabel.text = "\(unitRates[indexPath.row]) - up"
            cell?.eachamtLabel.text = "-"
        }
        else {
            cell?.unitrateLabel.text = "\(unitRates[indexPath.row-1] + 1) -\(unitRates[indexPath.row])"
            let a = unitPrices[indexPath.row] * (unitRates[indexPath.row] - unitRates[indexPath.row - 1])
            cell?.eachamtLabel.text = "\(a) Ks"
        }
        cell?.unitpriceLabel.text = "\(unitPrices[indexPath.row]) Ks"
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceLabel.text = "Services Charge: " + String(service)
    }
}

