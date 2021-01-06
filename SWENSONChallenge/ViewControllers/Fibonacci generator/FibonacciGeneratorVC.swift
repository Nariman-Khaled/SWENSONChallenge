//
//  FibonacciGeneratorVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class FibonacciGeneratorVC: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var txtUserInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    //MARK:- IBActions
    
    @IBAction func CloseGenerator(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func GenerateValue(_ sender: Any) {
        if let number  = txtUserInput.text {
       
        let num = Int(number) ?? 0
        
            let result = FibonacciGenerator.GenerateFibonacciValueFor(number :  num)
            lblResult.text = "\(result)"
            
        FibonacciGenerator.benchmark {
              // The first empty line is here is here simply for formatting.
              print()
            print("fib iterative: \(FibonacciGenerator.GenerateFibonacciValueFor(number :  num))")
          }
        
        FibonacciGenerator.benchmark {
              // The first empty line is here is here simply for formatting.
              print()
            print("fibRecursive: \(FibonacciGenerator.GenerateFibonacciValueFor(number:num , UseIterative : false))")
          }
        }
        
    }
    

}
