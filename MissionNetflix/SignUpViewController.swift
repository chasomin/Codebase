//
//  SignUpViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var moreInfoLabel: UILabel!
    @IBOutlet var moreInfoSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.image = .wordmark
        
        designTextField(emailTextField, placeholder: "이메일 주소 또는 전화번호")
        designTextField(passwordTextField, placeholder: "비밀번호")
        designTextField(nicknameTextField, placeholder: "닉네임")
        designTextField(locationTextField, placeholder: "위치")
        designTextField(codeTextField, placeholder: "추천 코드 입력")
        
        designSignUpButton()
        
        moreInfoLabel.text = "추가 정보 입력"
        designMoreInfoSwitch()
    }
    

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    
    @IBAction func moreInfoSwitchClicked(_ sender: UISwitch) {
        if moreInfoSwitch.isOn == false {
            nicknameTextField.isHidden = true
            locationTextField.isHidden = true
            codeTextField.isHidden = true
        } else {
            nicknameTextField.isHidden = false
            locationTextField.isHidden = false
            codeTextField.isHidden = false
            
        }
        
    }
    
    
    func designTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.backgroundColor = .gray
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        
        if textField == emailTextField {
            textField.keyboardType = .emailAddress
        }
        if textField == passwordTextField {
            textField.isSecureTextEntry = true
        }
    }
    
    func designSignUpButton() {
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 10
    }
    
    func designMoreInfoSwitch() {
        moreInfoSwitch.onTintColor = .red
        moreInfoSwitch.setOn(true, animated: true)
        moreInfoSwitch.thumbTintColor = .white
    }
}
