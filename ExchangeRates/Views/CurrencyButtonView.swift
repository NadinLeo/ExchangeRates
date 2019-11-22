//
//  CurrencyButton.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/21/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct CurrencyButtonView: View {
    let stringCurrencyCode: String
    let currencyName: String
    
    var body: some View {
        HStack {
            Image(stringCurrencyCode)
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            VStack {
                Text(stringCurrencyCode).font(.title)
                Text(currencyName).font(.subheadline)
            }.padding()
            
        }
    }
}

struct CurrencyButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyButtonView(stringCurrencyCode: "BGN", currencyName: "Euro")
    }
}
