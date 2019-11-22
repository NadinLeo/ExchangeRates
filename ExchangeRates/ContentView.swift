//
//  ContentView.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/8/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var exchangeData: ExchangerModel
    var body: some View {
        Exchanger(currencyFirst: self.exchangeData.currencyFirst, currencySecond: self.exchangeData.currencySecond, inputFirst: self.exchangeData.firstInput,
                  inputSecond: self.exchangeData.secondInput)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
