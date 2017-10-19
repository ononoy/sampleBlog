//
//  TopViewController.swift
//  sampleBlog
//
//  Created by y on 2017/10/18.
//  Copyright © 2017年 onono. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         tableView.register(UINib(nibName: "BlogListCell", bundle: nil), forCellReuseIdentifier: "BlogListCell")
        
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    
    //
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //セクションが1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogListCell", for: indexPath) as! BlogListCell
        cell.dateLabel.text = "10月18日"
        cell.titleLabel.text = "テスト"
        return cell
    }
    
    



}
