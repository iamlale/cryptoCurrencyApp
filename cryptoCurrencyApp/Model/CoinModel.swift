//
//  CoinModel.swift
//  cryptoCurrencyApp
//
//  Created by Lale Huseyin on 13.05.2024.
//

import Foundation

struct CoinModel: Codable {
    let data : DataClass
}

struct DataClass: Codable {
    let coins : [Coin]
}

struct Coin: Codable {
    let uuid : String
    let symbol : String
    let name: String
    let iconUrl: String
    let marketCap : String
    let price: String
    let listedAt : Int
    let change: String
    let rank: Int
    let the24HVolume : String
    let sparkline: [String]
    
    enum CodingKeys : String, CodingKey {
        case uuid,symbol,name,iconUrl,marketCap,price,listedAt,change,rank,sparkline
        case the24HVolume = "24hVolume"
        
    }

}
