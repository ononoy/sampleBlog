//
//  DetailViewController.swift
//  sampleBlog
//
//  Created by y on 2017/10/18.
//  Copyright © 2017年 onono. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    var blog : BlogRealm!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let topLabel = UILabel(frame: CGRect(x: 15, y: 100, width: view.frame.width - 30, height: 20))
        topLabel.text = blog.title
        topLabel.font = UIFont.boldSystemFont(ofSize: 17)
        view.addSubview(topLabel)
        
        let topLabel2 = UILabel(frame: CGRect(x: 15, y: 200, width: view.frame.width - 30, height: 20))
        topLabel2.text = blog.content
        topLabel2.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(topLabel2)
        
        //編集ボタン
        let naviBarBtn = UIBarButtonItem(title: "編集", style: UIBarButtonItemStyle.plain, target: self, action: #selector(goEditPage))
        navigationItem.rightBarButtonItem = naviBarBtn
        
    }
    
    func goEditPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createBlogViewcontroller = storyboard.instantiateViewController(withIdentifier: "CreateViewController") as! CreateViewController
        createBlogViewcontroller.isFromDetailVC = true
        createBlogViewcontroller.blog = self.blog
        navigationController?.pushViewController(createBlogViewcontroller, animated: true)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
