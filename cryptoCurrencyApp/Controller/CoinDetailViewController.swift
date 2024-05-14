//
//  CoinDetailViewController.swift
//  cryptoCurrencyApp
//
//  Created by Lale Huseyin on 14.05.2024.
//

import Foundation
import UIKit

class CoinDetailViewController: UIViewController {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    
    static var coinDetails : Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = nil
        self.title = CoinDetailViewController.coinDetails?.symbol
        
        highLabel.colorString(text: String(format: "High: %.3f", Double(CoinDetailViewController.coinDetails!.sparkline.max()!)!) , coloredText: "High:")
        lowLabel.textColor = .red
        lowLabel.colorString(text: String(format: "Low: %.3f", Double(CoinDetailViewController.coinDetails!.sparkline.min()!)!) , coloredText: "Low:")
        
        coinPrice.text = String(format: "%.3f", Double(CoinDetailViewController.coinDetails!.price)!)
        coinPrice.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        rankLabel.text = "\((CoinDetailViewController.coinDetails?.change)!)%"
        if rankLabel.text?.first == "-"{
            rankLabel.textColor = .red
        }
        else{
            rankLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
        }

        let newUrl = CoinDetailViewController.coinDetails?.iconUrl.replacingOccurrences(of: "svg", with: "png")
        let url = URL(string: (newUrl!))
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            self.coinImage.image = UIImage(data: imageData)
        }
        
    }

}
extension CoinDetailViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (CoinDetailViewController.coinDetails?.sparkline.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sparklineCell", for: indexPath)
        cell.textLabel?.text = String(format: "%.3f", Double((CoinDetailViewController.coinDetails?.sparkline[indexPath.row])!)!)
        cell.textLabel?.textColor = UIColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        cell.layer.cornerRadius = 2
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = true
        return cell
    }
    
    
}
extension UILabel {
    
    func colorString(text: String?, coloredText: String?, color: UIColor? = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) {
        
        let attributedString = NSMutableAttributedString(string: text!)
        let range = (text! as NSString).range(of: coloredText!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: color!], range: range)
        self.attributedText = attributedString
    }
}
