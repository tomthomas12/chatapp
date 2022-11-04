//
//  RegistrationController.swift
//  ChatApp
//
//  Created by ARM 097 on 03/11/22.
//

import UIKit
class RegistrationController: UIViewController{
    private lazy var emailContainerView: InputContainerView  = {
        return InputContainerView(image:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    }()
    private lazy var fullnameContainerView: InputContainerView  = {
        return InputContainerView(image:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: fullnameTextField )
    }()
    private lazy var usernameContainerView: InputContainerView  = {
        return InputContainerView(image:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: usernameTextField)
    }()
    private lazy var PasswordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        
    }()
    private let  plusPhotoButton: UIButton={
        let button = UIButton(type:  .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action:  #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    private let     emailTextField = CustomTextField(placeholder:"Email" )
    private let     fullnameTextField = CustomTextField(placeholder:"Fullname" )
    private let     usernameTextField = CustomTextField(placeholder:"Username" )
    private let     passwordTextField: CustomTextField={
        let tf = CustomTextField(placeholder: "Password")
        return tf
    }()
    private let signUpBotton: UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configeUI()
    }
    @objc func handleSelectPhoto(){
        print("photo")
    }
    func configeUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.setDimensions(height: 200, width: 200)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, PasswordContainerView, fullnameTextField,usernameTextField,signUpBotton])
        stack.axis = .vertical
        stack.spacing = 15
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0)
    }
    
}
