//
//  OnboardingViewModel.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 27/06/2022.
//

import Foundation
import Combine

class OnboardingViewModel {
    
    private(set) var onBoardingDataSource: [Onboarding] = []
    
    init() {
        getOnboardingData()
    }
    
    private func getOnboardingData() {
        let onBoarding: [Onboarding] = [Onboarding(image: "task", title: "Add your tasks to manage your daily schedule"),
                                         Onboarding(image: "calendar", title: "Choose your date and time"),
                                         Onboarding(image: "notification", title: "Let us give you an alert!")]
        
        onBoardingDataSource.append(contentsOf: onBoarding)
    }
}
