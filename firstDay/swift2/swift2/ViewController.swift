//
//  ViewController.swift
//  swift2
//
//  Created by Developer on 2018/3/24.
//  Copyright © 2018年 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var table : UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.table = UITableView(frame:CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height))
        self.table!.delegate = self
        self.table!.dataSource = self
        self.table?.separatorStyle = UITableViewCellSeparatorStyle.none
        self.table?.register(UITableViewCell.self, forCellReuseIdentifier:"haha")
        self.view.addSubview(self.table!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "haha")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "haha")
        }
        cell?.textLabel?.text = "hahahahahhaha"
        return cell!;
    }
    
    
    
}

