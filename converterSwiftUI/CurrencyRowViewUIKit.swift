//
//  CurrencyRowViewUIKit.swift
//  converterSwiftUI
//
//  Created by EDOUARD CHEVENSLOVE on 06/12/2023.
//

import SwiftUI


import UIKit

class CurrencyRowViewUIKit: UIView {
    let currencyCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()

    var amountBinding: Binding<Double>?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(currencyCodeLabel)
        addSubview(amountTextField)

        NSLayoutConstraint.activate([
            currencyCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            currencyCodeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            amountTextField.leadingAnchor.constraint(equalTo: currencyCodeLabel.trailingAnchor, constant: 8),
            amountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            amountTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        amountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    func configure(with currencyCode: String, amount: Binding<Double>) {
        currencyCodeLabel.text = currencyCode
        amountBinding = amount
        updateTextFieldText()
    }

    @objc private func textFieldDidChange() {
        updateAmount()
    }

    private func updateAmount() {
        guard let newText = amountTextField.text else {
            amountBinding?.wrappedValue = 0.0
            return
        }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2

        if let formattedNumber = formatter.number(from: newText) {
            amountBinding?.wrappedValue = formattedNumber.doubleValue
        } else {
            amountBinding?.wrappedValue = 0.0
        }

        updateTextFieldText()

        amountTextField.becomeFirstResponder()
    }

    private func updateTextFieldText() {
        guard let amountValue = amountBinding?.wrappedValue else {
            return
        }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2

        
        amountTextField.text = formatter.string(from: NSNumber(value: amountValue))
    }

}
