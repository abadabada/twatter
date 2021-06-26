//
//  Post.swift
//  twatter
//
//  Created by Abba on 26/06/2021.
//

import UIKit

class Post {
    let postText: String?
    let userUID: String?
    let postDate: String?
    
    init(postText: String, userUID: String, postDate: String) {
        self.postText = postText
        self.userUID = userUID
        self.postDate = postDate
    }

}
