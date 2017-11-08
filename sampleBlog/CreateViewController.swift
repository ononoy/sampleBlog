//
//  CreateViewController.swift
//  sampleBlog
//
//  Created by y on 2017/10/18.
//  Copyright © 2017年 onono. All rights reserved.


import UIKit
import RealmSwift

class CreateViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var mainBtn: UIButton!
    
    
    //ポイント detailかdetailじゃないかのflag
    var isFromDetailVC = false
    
    //ポイント ?はnillを許容 新規作成の際ではなく、blog編集画面で必要
    var blog: BlogRealm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if isFromDetailVC == true と同じ意味
        if isFromDetailVC {
            mainBtn.backgroundColor = UIColor.green
            
            mainBtn.setTitle("ブログを編集する", for: UIControlState.normal)
            titleTextField.text = blog?.title
            contentTextView.text = blog?.content
            navigationItem.title = "Blogを編集する"
            
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCreateBlogBtn(_ sender: Any) {
        
        
        if titleTextField.text == "" || contentTextView.text == "" {
            return
        }
        
        
        if isFromDetailVC {
            let realm = try! Realm()
            let updateBlog = realm.objects(BlogRealm.self).filter(NSPredicate(format: "title == %@", (blog?.title)!)).first
            
            try! realm.write {
                updateBlog?.title = titleTextField.text
                updateBlog?.content = contentTextView.text
                updateBlog?.createdAt = Date()
            }
            //topViewControllerで登録しておいた通知を発生させる
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "afterUpdate"), object: nil)
            
            navigationController?.popToRootViewController(animated: true)

        } else {
            let blog = BlogRealm()
            blog.title = titleTextField.text!
            blog.content = contentTextView.text!
            blog.createdAt = Date()
            
            let realm = try! Realm()
            try! realm.write() {
                realm.add(blog)
            }
            dismiss(animated: true, completion: nil)
        }
        
        
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //戻るボタン
    @IBAction func tappedBackBtn(_ sender: Any) {
        // if isFromDetailVC == true と同じ意味
        if isFromDetailVC {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
        
        
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
