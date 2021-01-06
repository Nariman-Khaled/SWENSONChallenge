//
//  CurrencyConvertorVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit
import FSnapChatLoading

class CurrencyConvertorVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var lblStaticTitle: UILabel!
    @IBOutlet weak var imgBaseFlag: UIImageView!
    @IBOutlet weak var lblBaseCode: UILabel!
    
    
    
    var currencyViewModel = CurrencyConvertorViewModel()
    
    @IBOutlet weak var tbvRates: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        loadData()
    }
    
    //MARK:- Setup
    func setupViews(){
        setupHeader()
        setupBaseCurrencyViews()
    }
    
    func setupHeader(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor =  UIColor.PrimaryOceanColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupBaseCurrencyViews(){
        imgBaseFlag.image = currencyViewModel.baseCurrencyInfo.flag
        lblBaseCode.text = currencyViewModel.baseCurrencyInfo.code
        }
    
    //MARK:- Data loading
    func loadData(){
        let loadingView = FSnapChatLoadingView()
         loadingView.show(view: self.view, color: UIColor.PrimaryOceanColor)
        currencyViewModel.loadData(completion: { [weak self]( message ,  loaded) in
            if loaded == true {
                loadingView.hide()
                self?.tbvRates.isHidden = false
                self?.tbvRates.reloadData()
            }
            else{
                loadingView.hide()
                self?.tbvRates.isHidden = true
                if message.isEmpty == false {
                    // show alert with message
                }
            }


        })
    }
    
    //MARK:- IBActions
    
    @IBAction func ChangeBaseCurrency(_ sender: Any) {
        
        if   let selectionVC = self.storyboard?.instantiateViewController(identifier: Constants.StoryBoardId.BaseCurrencySelection) as? BaseCurrencySelectionVC {
            selectionVC.currencyViewModel = currencyViewModel
          //  self.present(selectionVC, animated: true, completion: nil)
            self.navigationController?.pushViewController(selectionVC, animated: true)
        }
    }
    
}

extension CurrencyConvertorVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyViewModel.ratesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rateCell = tableView.dequeueReusableCell(withIdentifier:Constants.CellsIdentifiers.ratesCell) as? RateCell else {
            return UITableViewCell()
        }
        
        let rateData = currencyViewModel.ratesArr[indexPath.row]
        
        rateCell.setupCellWithRate(rate: rateData)
        
        return rateCell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rateData = currencyViewModel.ratesArr[indexPath.row]
        
        currencyViewModel.selectedRate = rateData
        
        if   let calculatorVC = self.storyboard?.instantiateViewController(identifier: Constants.StoryBoardId.CurrencyCalculator) as? CurrencyCalculatorVC {
            calculatorVC.currencyViewModel = currencyViewModel
            self.present(calculatorVC, animated: true, completion: nil)
            
        }
    }
    
    
}
