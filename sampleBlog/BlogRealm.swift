//
//  BlogRealm.swift
//  sampleBlog
//
//  Created by y on 2017/10/18.
//  Copyright © 2017年 onono. All rights reserved.
//

import UIKit
import RealmSwift

class BlogRealm: Object {
    
    
    dynamic var title: String?
    dynamic var content: String?
    dynamic var createdAt: Date?
    
    

}
