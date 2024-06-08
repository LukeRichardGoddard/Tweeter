//
//  Extensions.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
