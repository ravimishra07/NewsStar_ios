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
    let onboarding1 = OnBoardingModel(onBoardingTitle: "", onBoardingSubTitle: "", onBoardingImage: "")
    let onboarding2 = OnBoardingModel(onBoardingTitle: "", onBoardingSubTitle: "", onBoardingImage: "")
    let onboarding3 = OnBoardingModel(onBoardingTitle: "", onBoardingSubTitle: "", onBoardingImage: "")

    let onboardingArray: [OnBoardingModel] = [onboarding1,onboarding2,onboarding3]
    dataSource?.data.value = onboardingArray
}
}
