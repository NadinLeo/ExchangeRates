//
//  CurrencyRow.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct CurrencyRowView: View {
    var currencyModel: CurrencyModel
    

    var body: some View {
        
        
        return HStack {
            Image(currencyModel.currencyCode)
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 3)
            
            Text(currencyModel.currencyName).padding()
            
            Spacer()
            
            Text("\(currencyModel.curScale) \(currencyModel.currencyCode) = \(CurrencyFormatter.format(value: currencyModel.curOfficialRate) ?? "0") BYN")
        }.padding()
    }
}

struct CurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRowView(currencyModel: CurrencyModel(id: 1,
                                                 currencyId: 1,
                                                 currencyName: "RUB",
                                                 currencyCode: "RUB",
                                                 curScale: 100,
                                                 curOfficialRate: 20))
    }
}
