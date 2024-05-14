//
//  CoinListCVCell.swift
//  cryptoCurrencyApp
//
//  Created by Lale Huseyin on 14.05.2024.
//  coin list collection view cell

import UIKit

class CoinListCVCell: UICollectionViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(model : Coin){
        let newUrl = model.iconUrl.replacingOccurrences(of: "svg", with: "png")
        let url = URL(string: (newUrl))
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    self.coinImage.image = UIImage(data: imageData)
                }
        coinName.text = model.name
        symbolLabel.text = model.symbol
        priceLabel.text = String(format: "$%.3f", Double(model.price)!)
        changeLabel.text = "\(model.change)%"

    }
}
