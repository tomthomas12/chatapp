//
//  inContainerView.swift
//  ChatApp
//
//  Created by ARM 097 on 07/11/22.
//


//
//  InputContainerView.swift
//  ChatApp
//
//  Created by ARM 097 on 04/11/22.
//

import UIKit
class inContainerView: UIView{
    
    init(image: UIImage?, textField: UITextField ){
        super.init(frame: .zero)
        
        setHeight(height: 50)
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = .white
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.anchor(left: leftAnchor,  paddingLeft: 8)
        iv.setDimensions(height: 28, width: 28)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: iv.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: -4)
        
//        let dividerView = UIView()
//        dividerView.backgroundColor = .white
//        addSubview(dividerView)
//        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,paddingLeft: 0,height: 0.75)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
