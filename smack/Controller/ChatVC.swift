//
//  ChatVC.swift
//  smack
//
//  Created by Sergey Neupokoev on 27/7/19.
//  Copyright © 2019 Sergey Neupokoev. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    
    @IBOutlet weak var menuBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }
    


}
