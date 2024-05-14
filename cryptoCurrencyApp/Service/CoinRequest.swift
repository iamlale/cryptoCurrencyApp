//
//  CoinRequest.swift
//  cryptoCurrencyApp
//
//  Created by Lale Huseyin on 14.05.2024.
//

import Foundation

struct CoinRequest {
    
    let sourceURL: URL
    
    init() {
        let sourceString = "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins"
        guard let sourceURL = URL(string: sourceString) else {
            fatalError("Error")
        }
        self.sourceURL = sourceURL
    }
    func getCoins(completion : @escaping(Result<[Coin],CoinRequestError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coin = try decoder.decode(CoinModel.self, from: jsonData)
                completion(.success(coin.data.coins))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}

enum CoinRequestError: Error {
    case noDataAvailable
    case canNotProcessData
}
