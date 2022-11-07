//
//  RegistrationController.swift
//  ChatApp
//
//  Created by ARM 097 on 03/11/22.
//

import UIKit


class RegistrationController: UIViewController{
    
    private var viewModel = RegistrationViewModel()
    
    private lazy var emailContainerView:inContainerView  = {
        return inContainerView(image:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    }()
    private lazy var fullnameContainerView:inContainerView  = {
        return inContainerView(image:  #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullnameTextField )
    }()
    private lazy var usernameContainerView:inContainerView  = {
        return inContainerView(image:  #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: usernameTextField)
    }()
    private lazy var PasswordContainerView:inContainerView = {
        return inContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        
    }()
    
    
    private let  plusPhotoButton: UIButton={
        let button = UIButton(type:  .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action:  #selector(handleSelectPhoto), for: .touchUpInside)
        button.imageView?.clipsToBounds = true
        button.clipsToBounds = true
   
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
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountBoutton: UIButton={
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account??", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Login page", attributes: [.font: UIFont.boldSystemFont(ofSize: 16),.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configeUI()
        cofigureNotificationObervers()
    }
    
    @objc func handleSelectPhoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate=self
        present(imagePickerController, animated: true, completion: nil)
    }
    @objc func handleSignup(){
        print("checking")
    }
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    @objc func textDidChange(sender:UITextField){
        if sender == emailTextField{
            viewModel.email=sender.text
        }else if sender == passwordTextField {
            viewModel.password=sender.text
        }else if sender == fullnameTextField {
            viewModel.fullname=sender.text
        }else if sender == usernameTextField {
            viewModel.username=sender.text
        }
        checkFormStatus()
    }
    func checkFormStatus()  {
        if viewModel.formIsValid{
            signUpBotton.isEnabled=true
            signUpBotton.backgroundColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }else{
            signUpBotton.isEnabled=true
            signUpBotton.backgroundColor=#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        
    }
    func configeUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.setDimensions(height: 200, width: 200)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, fullnameTextField,usernameTextField,PasswordContainerView,signUpBotton])
        stack.axis = .vertical
        stack.spacing = 15
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0)
        view.addSubview(alreadyHaveAccountBoutton)
        alreadyHaveAccountBoutton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 20,paddingBottom: -20,paddingRight: 20)
    }
    func cofigureNotificationObervers()  {
        emailTextField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
    }
    
}
extension RegistrationController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker:UIImagePickerController,didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:Any])  {
        let image = info[.originalImage] as?UIImage
        plusPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor=UIColor(white: 1, alpha: 0.7) .cgColor
        plusPhotoButton.layer.borderWidth=3.0
        plusPhotoButton.layer.cornerRadius=200/2
        dismiss(animated: true, completion: nil)
       
    }
}
