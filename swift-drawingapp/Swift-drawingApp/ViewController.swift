//
//  ViewController.swift
//  Swift-drawingApp
//
//  Created by herb.salt on 2022/07/04.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var makeSquareButton: UIButton = {
        let button = UIButton()
        button.setTitle("사각형", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(makeSquare), for: .touchUpInside)
        return button
    }()
    
    private lazy var makeDrawingButton: UIButton = {
        let button = UIButton()
        button.setTitle("드로잉", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(makeDrawing), for: .touchUpInside)
        return button
    }()
    
    private lazy var syncButton: UIButton = {
        let button = UIButton()
        button.setTitle("동기화", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(doSync), for: .touchUpInside)
        return button
    }()
    
    var objects: [Object] = []
    var selectedSquareId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(makeSquareButton)
        view.addSubview(makeDrawingButton)
        view.addSubview(syncButton)
        
        view.updateConstraintsIfNeeded()
    }
    
    @objc
    private func makeSquare() {
        let square = Square()
        square.delegate = self
        objects.append(square)
        
        view.addSubview(square)
        view.updateConstraintsIfNeeded()
    }
    
    @objc
    private func makeDrawing() {
    }
    
    @objc
    private func doSync() {
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        makeDrawingButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(120)
        }
        
        makeSquareButton.snp.makeConstraints { make in
            make.trailing.equalTo(makeDrawingButton.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(120)
        }
        
        syncButton.snp.makeConstraints { make in
            make.leading.equalTo(makeDrawingButton.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(120)
        }
    }


}

extension ViewController: SquareProtocol {
    func selectSquare(_ square: Square) {
        for object in objects {
            if let squareObject = object as? Square {
                if squareObject.id == selectedSquareId {
                    squareObject.isSelected = false
                }
                if squareObject.id == square.id && square.id != selectedSquareId {
                    square.isSelected = true
                }
            }
        }
        
        selectedSquareId = square.id
    }
}
