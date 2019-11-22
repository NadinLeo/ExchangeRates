//
//  Exchanger.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/21/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct Exchanger: View {
    @ObservedObject model: ExchangerModel
    let currencyFirst: CurrencyModel?
    let currencySecond: CurrencyModel?
    @State var inputFirst: Double = 23
    @State var inputSecond: Double = 23
    
    var inputFirstStr : Binding<String> {
        Binding<String>(
            get: { "\(self.inputFirst)" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.inputFirst = value.doubleValue
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
            Text("\(inputFirst)")
            HStack {
                CurrencyButton(
                    stringCurrencyCode: currencyFirst?.currencyCode ?? "default",
                    currencyName: currencyFirst?.currencyName ?? "default")
                Spacer()
                TextField("Input value", text: inputFirstStr, onEditingChanged: {_ in print("Text was changed")})
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .frame(width: CGFloat(integerLiteral: 100), height: nil, alignment: .trailing)
                
            }.padding()
            HStack
                {
                    CurrencyButton(stringCurrencyCode: currencySecond?.currencyCode ?? "default", currencyName: currencySecond?.currencyName ?? "default")
                    Spacer()
                    TextField("Input value", value: $inputSecond, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .frame(width: CGFloat(integerLiteral: 100), height: nil, alignment: .trailing)
            }.padding()
        }
    }
}

struct Exchanger_Previews: PreviewProvider {
    static var previews: some View {
        Exchanger(currencyFirst: CurrencyModel(id: 1, currencyId: 1, currencyName: "Italy", currencyCode: "BGN", curScale: 1, curOfficialRate: 1), currencySecond: CurrencyModel(id: 1, currencyId: 1, currencyName: "Italy", currencyCode: "IT", curScale: 1, curOfficialRate: 1), inputFirst: 1, inputSecond: 1)
    }
}
