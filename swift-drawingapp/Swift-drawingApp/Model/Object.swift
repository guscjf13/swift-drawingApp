//
//  Object.swift
//  Swift-drawingApp
//
//  Created by herb.salt on 2022/07/04.
//

import Foundation
import UIKit

class Object: UIView {
    
    var id = String(Int.random(in: 100000...999999))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackgroundColor() {
        let colors: [UIColor] = [.systemGreen, .systemBlue, .systemOrange, .systemYellow, .systemPink, .systemPurple, .systemTeal, .systemIndigo,
                                 .systemBrown, .systemMint, .systemCyan, .systemGray, .systemGray2, .systemGray3, .systemGray4, .systemGray5, .systemGray6]
        self.backgroundColor = colors.randomElement() ?? .systemGreen
    }
}
