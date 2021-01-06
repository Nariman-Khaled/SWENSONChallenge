//
//  AnagramCheckerVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class AnagramCheckerVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var txtFirstString: UITextField!
    @IBOutlet weak var txtSecondString: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    //MARK:- ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    //MARK: - Setup
    
    
    
    //MARK:- IBActions
    
    @IBAction func ValidateUserInputs(_ sender: Any) {
        guard let firstString = txtFirstString.text , firstString.isEmpty == false , let secondString = txtSecondString.text , secondString.isEmpty == false else {
            let alert = UIAlertController.init(title: "Error", message: "must enter all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        CheckAnagrams(firstString: firstString, scondString: secondString)
    }
    
    @IBAction func DismissController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- Helper methods
    
    func CheckAnagrams(firstString : String , scondString : String) {
      let isValidAnagram = AnagramChecker.checkForAnagram(firstString: firstString, secondString: scondString)
        if isValidAnagram {
            lblResult.text = "Valid anagram "
            lblResult.textColor = UIColor.systemGreen
        }else {
            lblResult.text = "Not a valid anagram"
            lblResult.textColor = UIColor.systemRed
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
