//
//  CurrencyRowView.swift
//  converterSwiftUI
//
//  Created by EDOUARD CHEVENSLOVE on 06/12/2023.
//

import SwiftUI

struct CurrencyRowView: View {
    var currencyCode: String

    @Binding var amount: Double

    var body: some View {
        HStack {
            Text(currencyCode)
                .padding(.leading)

            TextField("Amount", value: $amount, formatter: createNumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
        }
    }

    private func createNumberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
}
