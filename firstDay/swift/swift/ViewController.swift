//
//  ViewController.swift
//  swift
//
//  Created by Developer on 2018/3/24.
//  Copyright © 2018年 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let but = UIButton(frame:CGRect(x:1,y:1,width:100,height:100))
        but.backgroundColor=UIColor.red
        self.view.addSubview(but)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

