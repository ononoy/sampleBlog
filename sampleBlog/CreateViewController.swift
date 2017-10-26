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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCreateBlogBtn(_ sender: Any) {
        
        
        if titleTextField.text == "" || contentTextView.text == "" {
            return
        }
        let blog = BlogRealm()
        blog.title = titleTextField.text!
        blog.content = contentTextView.text!
        blog.createdAt = Date()
        
        let realm = try! Realm()
        try! realm.write() {
            realm.add(blog)
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedBackBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
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
