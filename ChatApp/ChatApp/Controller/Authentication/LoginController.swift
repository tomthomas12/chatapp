//
//  LoginController.swift
//  ChatApp
//
//  Created by ARM 097 on 03/11/22.
//

import UIKit

class LoginController: UIViewController{
    
    private var viewModel = LoginViewModel()
    
    private let iconImage: UIImageView={
        let iv = UIImageView()
        iv.image=UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: InputContainerView  = {
        return InputContainerView(image:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    }()
    
    private lazy var PasswordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        
    }()
    
    private let loginBotton: UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let 	emailTextField = CustomTextField(placeholder:"Email" )
    private let     passwordTextField: CustomTextField={
        let tf = CustomTextField(placeholder: "Password")
        return tf
    }()
    
    private let dontHaveAccountBoutton: UIButton={
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Dont have an account??", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "sign up", attributes: [.font: UIFont.boldSystemFont(ofSize: 16),.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    @objc func handleLogin(){
        print("checking")
    }
    @objc func textDidChange(sender:UITextField){
        if sender == emailTextField{
            viewModel.email=sender.text
        }else{
            viewModel.password=sender.text
        }
        checkFormStatus()
    }
    @objc func handleShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    func checkFormStatus()  {
        if viewModel.formIsValid{
            loginBotton.isEnabled=true
            loginBotton.backgroundColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }else{
            loginBotton.isEnabled=true
            loginBotton.backgroundColor=#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        
    }
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, PasswordContainerView, loginBotton])
        stack.axis = .vertical
        stack.spacing = 15
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0)
        view.addSubview(dontHaveAccountBoutton)
        dontHaveAccountBoutton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 20,paddingBottom: -20,paddingRight: 20)
        emailTextField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
    }

}
