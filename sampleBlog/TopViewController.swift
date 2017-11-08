//
//  TopViewController.swift
//  sampleBlog
//
//  Created by y on 2017/10/18.
//  Copyright © 2017年 onono. All rights reserved.
//

import UIKit
import RealmSwift

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [BlogRealm]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BlogListCell", bundle: nil), forCellReuseIdentifier: "BlogListCell")
       
        var realmDataArray = [BlogRealm]()
        let realm = try! Realm()
        var sortedBlogRealmData : Results<BlogRealm>
        //realmから引っ張ってきた全てのデータ ※created_atでソートしてる
        sortedBlogRealmData = realm.objects(BlogRealm.self).sorted(byKeyPath: "createdAt", ascending: false)
        
        var i = 0
        while i < realm.objects(BlogRealm.self).count {
            let blog = BlogRealm()
            blog.title = sortedBlogRealmData[i].title
            blog.content = sortedBlogRealmData[i].content
            blog.createdAt = sortedBlogRealmData[i].createdAt
            realmDataArray.append(blog)
            i += 1
        }
        print(realmDataArray.count)
        
        dataSource = realmDataArray
        
        tableView.reloadData()
        
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    //遷移するコード
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let blogDetailVC = DetailViewController()
        blogDetailVC.blog = dataSource[indexPath.row]
        navigationController?.pushViewController(blogDetailVC, animated: true)
        
        
    }
    
    
    //
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //セクションが1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource != nil ? dataSource.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogListCell", for: indexPath) as! BlogListCell
        cell.dateLabel.text = "10月18日"
        cell.titleLabel.text = dataSource[indexPath.row].title != nil ? dataSource[indexPath.row].title : "titleはないです"
        
        return cell
    }
    
    



}
