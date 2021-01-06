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
        
         
        if let number  = txtUserInput.text , number.isEmpty == false {
            
            let num = Int(number) ?? 0
            //
            GenerateFibonacciAndDisplayResult(number: num)
            //For test usage , method is created to calculate the Fibonacci number with both iterative and recursive approaches
            GenerateBothFibonacciInternallyWithBenchmarking(number: num)
            
        }
        else {
            lblResult.text =  "-"
            PresentErrorWithMessage( message: NSLocalizedString("Required input", comment: ""))
        }
        
    }
    
    func GenerateFibonacciAndDisplayResult(number : Int){
        let result = FibonacciGenerator.GenerateFibonacciValueFor(number :  number , UseIterative: false)
        if result.Message.isEmpty {
            lblResult.text = "\(result.Result)"
        }
        else{
            lblResult.text =  "-"
            PresentErrorWithMessage( message: result.Message )
        }
    }
    
    
    
    func GenerateBothFibonacciInternallyWithBenchmarking(number : Int){
        FibonacciGenerator.benchmark {
            print()
            print(" iterative  Fibonacci : \(FibonacciGenerator.GenerateFibonacciValueFor(number :  number).Result)")
        }
        
        FibonacciGenerator.benchmark {
            print()
            print(" Recursive Fibonacci: \(FibonacciGenerator.GenerateFibonacciValueFor(number:number , UseIterative : false).Result)")
        }
    }
    
    
}
