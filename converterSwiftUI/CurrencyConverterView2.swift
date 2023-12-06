//
//  CurrencyConverterView2.swift
//  converterSwiftUI
//
//  Created by EDOUARD CHEVENSLOVE on 06/12/2023.
//

import SwiftUI



struct CurrencyConverterView2: View {
    let currencies: [String: Double] = [
        "USD": 1.08,
        "EUR": 1.0,
        "YEN": 158.60,
    ]

    @State private var amount: Double = 0

    var body: some View {
        List {
            ForEach(currencies.sorted(by: <), id: \.key) { currencyCode, exchangeRate in
                HStack {
                    CurrencyRowViewUIKitWrapper(currencyCode: currencyCode, amount: self.binding(for: currencyCode))
                }
            }.listStyle(GroupedListStyle())
                .allowsHitTesting(true)
        }
        
    }

    private func binding(for currencyCode: String) -> Binding<Double> {
        return Binding<Double>(
            get: {
                self.amount * self.currencies[currencyCode]!
            },
            set: { newValue in
                self.amount = newValue / self.currencies[currencyCode]!
            }
        )
    }
}

