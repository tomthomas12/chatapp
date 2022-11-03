//
//  LoginController.swift
//  ChatApp
//
//  Created by ARM 097 on 03/11/22.
//

import UIKit
class LoginController: UIViewController{
    
    private let iconImage: UIImageView={
        let iv = UIImageView()
        iv.image=UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
    }
    func configureGradientLayer()  {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
    }
}
