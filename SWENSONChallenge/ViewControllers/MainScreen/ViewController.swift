//
//  ViewController.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit
import EzPopup

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var btnGenerator: UIButton!
    
    //MARK:- ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    //MARK:- Setup
    func setupViews(){
        self.title = NSLocalizedString("Main Menu title", comment: "")
        btnGenerator.addTarget(self, action: #selector(ShowGeneratorPopup(_:)), for: .touchUpInside)
        btnGenerator.setTitle(NSLocalizedString("Fibonacci generator", comment: ""), for: .normal)
    }
    
    
    //MARK:- IBActions
    @IBAction func ShowGeneratorPopup(_ sender: UIButton) {
       let generatorVC = FibonacciGeneratorVC.loadFromNib()
        
        let ezPopup = PopupViewController(contentController: generatorVC, popupWidth: UIScreen.main.bounds.width - 70, popupHeight: 300)
        self.present(ezPopup, animated: true, completion: nil)
        
    }


}

