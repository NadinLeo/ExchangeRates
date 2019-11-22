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
    @State var isCurrencyFirstSelectorActive = false
    @State var isCurrencySecondSelectorActive = false
    
    var inputFirst : Binding<String> {
        Binding<String>(
            get: { "\(CurrencyFormatter.format(value:self.model.firstInput) ?? "0")" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.model.firstInput = value.doubleValue
                }
        })
    }
    
    
    var inputSecond : Binding<String> {
        Binding<String>(
            get: { "\(CurrencyFormatter.format(value:self.model.secondInput) ?? "0")" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.model.secondInput = value.doubleValue
                }
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Label")
                    .resizable()
                    .scaledToFill()
                    .padding(.bottom)
                    .frame(width: 50.0, height: 50.0)
                HStack {
                    NavigationLink(destination: CurrencyListView(currencyModelList: model.currencyModelList) { newCurrencyModel in
                        self.model.currencyFirst = newCurrencyModel
                        self.isCurrencyFirstSelectorActive = false
                    }, isActive: self.$isCurrencyFirstSelectorActive) {
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
                    NavigationLink(destination: CurrencyListView(currencyModelList: model.currencyModelList) { newCurrencyModel in
                        self.model.currencySecond = newCurrencyModel
                        self.isCurrencySecondSelectorActive = false
                    }, isActive: self.$isCurrencySecondSelectorActive) {
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
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    TextField("Input value", text: self.inputSecond)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .frame(width: CGFloat(integerLiteral: 100),
                               height: nil,
                               alignment: .trailing)
                }.padding()
                Spacer()
            }
        }
        .navigationBarHidden(false)
        .navigationBarTitle("Exchanger", displayMode: .large)
        
    }
}

struct Exchanger_Previews: PreviewProvider {
    static var previews: some View {
        let model = ExchangerModel(curManager: CurrencyManagerStub())
        return ExchangerView(model: model )
    }
}
