//
//  UIColor + Extension.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 22/06/24.
//

import Foundation
import UIKit

extension UIColor {
    // "@nonobjc" define que o método não estará disponível no contexto Objective-C
    // o uso de "class var" permite que a propriedade seja mais flexível.
    // especialmente se houver a necessidade de sobrescrever essa propriedade.
    @nonobjc class var appBackGround: UIColor { // por que "@nonobjct class var..."?
        
        return UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        
    }
    
}
