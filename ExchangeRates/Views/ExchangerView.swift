//
//  Exchanger.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/21/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct ExchangerView: View {
    @ObservedObject var model: ExchangerModel
    @State var isCurrencySelectorActive = false

    var inputFirst : Binding<String> {
        Binding<String>(
            get: { "\(self.model.firstInput)" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.model.firstInput = value.doubleValue
                }
        })
    }
    
    var inputSecond : Binding<String> {
        Binding<String>(
            get: { "\(self.model.secondInput)" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.model.secondInput = value.doubleValue
                }
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(self.$model.firstInput.wrappedValue)")
                HStack {
                    NavigationLink(destination: CurrencyListView(currencyModelList: model.curencuModelList) { newCurrencyModel in
                        self.model.currencyFirst = newCurrencyModel
                        self.isCurrencySelectorActive = false
                    }, isActive: self.$isCurrencySelectorActive) {
                            CurrencyButtonView(
                                stringCurrencyCode: self
                                    .$model
                                    .currencyFirst
                                    .wrappedValue?
                                    .currencyCode ?? "default",
                                currencyName: self
                                    .$model
                                    .currencyFirst
                                    .wrappedValue?
                                    .currencyName ?? "default")
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                    TextField("Input value",
                              text: self.inputFirst)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .frame(width: CGFloat(integerLiteral: 100),
                               height: nil,
                               alignment: .trailing)
                    
                }.padding()
                HStack {
                    CurrencyButtonView(
                        stringCurrencyCode: self
                            .$model
                            .currencySecond
                            .wrappedValue?
                            .currencyCode ?? "default",
                        currencyName: self
                            .$model
                            .currencySecond
                            .wrappedValue?
                            .currencyName ?? "default")
                    Spacer()
                    TextField("Input value", text: self.inputSecond)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .frame(width: CGFloat(integerLiteral: 100),
                               height: nil,
                               alignment: .trailing)
                }.padding()
            }
        }
    }
}

struct Exchanger_Previews: PreviewProvider {
    static var previews: some View {
        let model = ExchangerModel(curManager: CurrencyManagerStub())
        return ExchangerView(model: model )
    }
}
