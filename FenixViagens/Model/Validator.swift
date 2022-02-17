//
//  Validator.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 13/02/22.
//

import UIKit

class Validator: NSObject {
    func validateTextFields(_ textFields: [UITextField?]) -> Bool {
        for textField in textFields {
            if textField?.text == "" {
                shakeTextField(textField)
                return false
            }
        }
        return true
    }
    
    func shakeTextField(_ textField: UITextField?) {
        guard let textField = textField else { return }
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let positionInitial = CGPoint(x: textField.center.x + 5, y: textField.center.y)
        let positionFinal = CGPoint(x: textField.center.x - 5, y: textField.center.y)

        shake.fromValue = positionInitial
        shake.toValue = positionFinal
        
        textField.layer.add(shake, forKey: nil)
    }
}
