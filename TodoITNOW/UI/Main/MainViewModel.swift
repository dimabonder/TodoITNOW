//
//  MainViewModel.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import Foundation
import Combine
import UIKit

class MainViewModel {
    
    private(set) var userProfile: UserProfile
    
    init(userProfile: UserProfile) {
        self.userProfile = userProfile
    }
    
    func getUserImage() -> UIImage {
        if let image = UIImage(data: userProfile.profileImage) {
            return image
        }
        return UIImage()
    }
}

extension MainViewModel {
    var profileName: String {
        userProfile.name
    }
}
