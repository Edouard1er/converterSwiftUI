//
//  CurrencyRowViewUIKitWrapper.swift
//  converterSwiftUI
//
//  Created by EDOUARD CHEVENSLOVE on 06/12/2023.
//
import SwiftUI

struct CurrencyRowViewUIKitWrapper: UIViewRepresentable {
    var currencyCode: String
    var amount: Binding<Double>

    func makeUIView(context: Context) -> CurrencyRowViewUIKit {
        let currencyRowView = CurrencyRowViewUIKit()
        currencyRowView.configure(with: currencyCode, amount: amount)
        return currencyRowView
    }

    func updateUIView(_ uiView: CurrencyRowViewUIKit, context: Context) {
        uiView.configure(with: currencyCode, amount: amount)

    }
}
