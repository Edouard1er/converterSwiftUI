//
//  CurrencyConverterView.swift
//  converterSwiftUI
//
//  Created by EDOUARD CHEVENSLOVE on 06/12/2023.
//

import SwiftUI

struct CurrencyConverterView: View {
    @State private var amount: Double = 1.0
    @State private var exchangeRates: [String: Double] = [:]

    var body: some View {
        List {
            ForEach(exchangeRates.sorted(by: <), id: \.key) { currencyCode, exchangeRate in
                HStack {
                    CurrencyRowViewUIKitWrapper(currencyCode: currencyCode, amount: self.binding(for: currencyCode))
                }
            }
        }
        .listStyle(GroupedListStyle())
        .onAppear {
            fetchExchangeRates()
        }
    }

    private func binding(for currencyCode: String) -> Binding<Double> {
        return Binding<Double>(
            get: {
                self.amount * self.exchangeRates[currencyCode]!
            },
            set: { newValue in
                self.amount = newValue / self.exchangeRates[currencyCode]!
            }
        )
    }

    private func fetchExchangeRates() {
        guard let url = URL(string: "https://open.er-api.com/v6/latest/USD") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let exchangeRatesData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let rates = exchangeRatesData["rates"] as? [String: Double] {
                        DispatchQueue.main.async {
                            self.exchangeRates = rates
                        }
                    }
                }
            } else if let error = error {
                print("Erreur de chargement des taux de change : \(error.localizedDescription)")
            }
        }
        .resume()
    }
}



