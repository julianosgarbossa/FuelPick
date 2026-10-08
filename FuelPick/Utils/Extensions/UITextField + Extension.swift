//
//  UITextField + Extension.swift
//  FuelPick
//
//  Created by Juliano Sgarbossa on 08/10/26.
//

import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar()
        doneToolbar.barStyle = .default
        doneToolbar.autoresizingMask = [.flexibleWidth]

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Ok", style: .prominent, target: self, action: #selector(doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        inputAccessoryView = doneToolbar
    }

    @objc
    private func doneButtonAction() {
        resignFirstResponder()
    }
}
