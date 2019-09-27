//
//  Constants.swift
//  smack
//
//  Created by Sergey Neupokoev on 27/7/19.
//  Copyright © 2019 Sergey Neupokoev. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://devslopeschattest.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"


//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
