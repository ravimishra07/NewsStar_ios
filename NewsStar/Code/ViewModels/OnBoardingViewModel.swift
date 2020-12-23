//
//  OnBoardingViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 21/12/20.
//

import Foundation
struct OnboardingViewModel {

weak var dataSource: GenericDataSource<OnBoardingModel>?

init(dataSource: GenericDataSource<OnBoardingModel>?) {
    self.dataSource = dataSource
}
func getOnboardingData(){
    let onboarding1 = OnBoardingModel(onBoardingTitle: "Personalized News", onBoardingSubTitle: "Read what you are interested in!", onBoardingImage: "newspaper")

    let onboarding2 = OnBoardingModel(onBoardingTitle: "Latest News", onBoardingSubTitle: "Get latest news from all over the globe", onBoardingImage: "globe")
    let onboarding3 = OnBoardingModel(onBoardingTitle: "100+ sources", onBoardingSubTitle: "Get news from 100+ sources", onBoardingImage: "path")

    let onboardingArray: [OnBoardingModel] = [onboarding1,onboarding2,onboarding3]
    dataSource?.data.value = onboardingArray
}
}
