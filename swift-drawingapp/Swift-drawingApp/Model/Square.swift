//
//  File.swift
//  Swift-drawingApp
//
//  Created by herb.salt on 2022/07/04.
//

import Foundation
import UIKit

class Square: Object {
    
    var delegate: SquareProtocol?
    
    var isSelected: Bool = false {
        didSet {
            if isSelected {
                self.layer.borderWidth = 5
            } else {
                self.layer.borderWidth = 0
            }
        }
    }
    
    var randomFrame: CGRect {
        return CGRect(
            x: CGFloat.random(in: 0...(UIScreen.main.bounds.width - 100)),
            y: CGFloat.random(in: 0...(UIScreen.main.bounds.height - 100 - 120)),
            width: 100,
            height: 100
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeBorderColor)))
        self.layer.borderColor = UIColor.systemRed.cgColor
        self.frame = randomFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func changeBorderColor() {
        delegate?.selectSquare(self)
    }
}

protocol SquareProtocol {
    func selectSquare(_ square: Square)
}
