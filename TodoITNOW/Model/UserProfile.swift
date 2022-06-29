//
//  UserProfile.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 30/06/2022.
//

import Foundation

class UserProfile {
    let name: String
    let profileImage: Data
    
    init(name: String, profileImage: Data) {
        self.name = name
        self.profileImage = profileImage
    }
}
