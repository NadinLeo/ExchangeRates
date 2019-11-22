//
//  Exchanger.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/21/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct Exchanger: View {
    @ObservedObject var model: ExchangerModel

    var inputFirstStr : Binding<String> {
        Binding<String>(
            get: { "\(self.model.firstInput)" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.model.firstInput = value.doubleValue
                }
            })
    }
    
    
//    @State var inputFirst: Double = 1 {
//        didSet {
//            print("Hello from UI")
//            //            guard let currencyFirst = currencyFirst else { return }
//            //            inputSecond = handleInput(changedCurrency: currencyFirst, inputValue: Double(inputFirst) as! Double) as! String
//        }
//    }
//    @State var inputSecond: Double = 1 {
//        didSet {
//            //            guard let currencySecond = currencySecond else { return }
//            //            inputFirst = handleInput(changedCurrency: currencySecond, inputValue: Double(inputSecond) as! Double) as! String
//        }
//    }
    
//    func handleInput(changedCurrency: CurrencyModel, inputValue: Double) -> Double {
//        let byCurrency = changedCurrency.convertTo(byCurrency: inputValue)
//        return changedCurrency.getValue(from: byCurrency)
//    }
    
    var body: some View {
        VStack {
            Text("\(self.$model.firstInput.wrappedValue)")
            HStack {
                CurrencyButton(
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
                Spacer()
                TextField("Input value", text: inputFirstStr)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .frame(width: CGFloat(integerLiteral: 100),
                           height: nil,
                           alignment: .trailing)
                
            }.padding()
//            HStack
//                {
//                    CurrencyButton(stringCurrencyCode: self.$model.currencySecond?.currencyCode ?? "default", currencyName: self.$model.currencySecond?.currencyName ?? "default")
//                    Spacer()
//                    TextField("Input value", value: model.secondInput, formatter: NumberFormatter())
//                        .multilineTextAlignment(.trailing)
//                        .keyboardType(.numberPad)
//                        .frame(width: CGFloat(integerLiteral: 100), height: nil, alignment: .trailing)
//            }.padding()
        }
    }
}

struct Exchanger_Previews: PreviewProvider {
    static var previews: some View {
        let model = ExchangerModel(curManager: CurrencyManagerStub())
        return Exchanger(model: model )
    }
}
