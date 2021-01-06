//
//  FibonacciGeneratorVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class FibonacciGeneratorVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var lblPopupHeader: UILabel!
    @IBOutlet weak var lblPopStaticText: UILabel!
    @IBOutlet weak var lblStaticUserInput: UILabel!
    @IBOutlet weak var lblStaticResult: UILabel!
    @IBOutlet weak var btnGenerate: UIButton!
    
    @IBOutlet weak var txtUserInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalizations()
    }
    
    func setupLocalizations(){
        lblPopupHeader.text = NSLocalizedString("Header", comment: "")
        lblPopStaticText.text = NSLocalizedString("static text", comment: "")
        lblStaticUserInput.text = NSLocalizedString("user input title", comment: "")
        btnGenerate.setTitle(NSLocalizedString("Generate", comment: ""), for: .normal)
        lblStaticResult.text = NSLocalizedString("Result", comment: "")
    }
    
    //MARK:- IBActions
    
    @IBAction func CloseGenerator(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func GenerateValue(_ sender: Any) {
        if let number  = txtUserInput.text {
            
            let num = Int(number) ?? 0
            
            let result = FibonacciGenerator.GenerateFibonacciValueFor(number :  num)
            if result.Message.isEmpty {
            lblResult.text = "\(result.Result)"
            }
            else{
                self.presentAlertWithTitle(title: NSLocalizedString("Error", comment: ""), message: result.Message  , options: .gotIt, completion: { (_) in})
            }
            
            FibonacciGenerator.benchmark {
                 print()
                print("fib iterative: \(FibonacciGenerator.GenerateFibonacciValueFor(number :  num))")
            }
            
            FibonacciGenerator.benchmark {
                print()
                print("fib Recursive: \(FibonacciGenerator.GenerateFibonacciValueFor(number:num , UseIterative : false))")
            }
        }
        
    }
    
    
}
