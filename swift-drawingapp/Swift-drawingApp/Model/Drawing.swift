//
//  File.swift
//  Swift-drawingApp
//
//  Created by herb.salt on 2022/07/04.
//

import Foundation
import UIKit

class Drawing: Object {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
