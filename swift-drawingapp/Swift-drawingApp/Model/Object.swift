//
//  Object.swift
//  Swift-drawingApp
//
//  Created by herb.salt on 2022/07/04.
//

import Foundation
import UIKit

class Object: UIView {
    
    var id: String
    
    override init(frame: CGRect) {
        id = String(Int.random(in: 100000...999999))
        
        super.init(frame: frame)
        
        setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackgroundColor() {
        self.backgroundColor = .orange
    }
}
