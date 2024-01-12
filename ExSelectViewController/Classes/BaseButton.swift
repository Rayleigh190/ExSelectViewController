//
//  BaseButton.swift
//  ExSelectViewController
//
//  Created by 우진 on 1/10/24.
//

import UIKit

class BaseButton: UIButton {
    
    init(style: BaseButtonStyle){
        super.init(frame: .zero)
        
        switch style {
        case .clear: setupButton(style: .clear)
        case .green: setupButton(style: .green)
        case .navy: setupButton(style: .navy)
        case .black: setupButton(style: .black)
        case .gray: setupButton(style: .gray)
        }
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2.4
    }

}

extension BaseButton {
    func setupButton(style: BaseButtonStyle) {
        
        switch style {
        case .clear:
            layer.borderWidth = 1.0
            layer.borderColor = UIColor.black.cgColor
            backgroundColor = .clear
            setTitleColor(UIColor.black, for: .normal)
        case .gray:
            backgroundColor = .BaseGray200
            setTitleColor(UIColor.BaseGray600, for: .normal)
        case .navy:
            backgroundColor = .BaseNavy
            setTitleColor(.white, for: .normal)
        case .black:
            backgroundColor = .BaseGray900
            setTitleColor(.white, for: .normal)
        case .green:
            backgroundColor = .BaseGreen
            setTitleColor(.white, for: .normal)
        }
        
    }
}
