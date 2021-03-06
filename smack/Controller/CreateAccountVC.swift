//
//  CreateAccountVC.swift
//  smack
//
//  Created by Sergey Neupokoev on 27/7/19.
//  Copyright © 2019 Sergey Neupokoev. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Set the user avatar
    func setUserAvatar () {
        userImage.image = UIImage(named: UserDataService.instance.avatarName)
        avatarName = UserDataService.instance.avatarName
        print(UserDataService.instance.avatarName)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(UserDataService.instance.avatarName)
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    //Default variables
    var avatarName = "ProfileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    //MARK: Buttons actions
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let name = usernameTxt.text , usernameTxt.text != "" else {return}
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let password = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password, completion: {(success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: {(success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: {(success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                            }
                        }   )
                    }
                    
                })
            }
        })
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
     performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: UIButton) {
    }
    
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    


}
