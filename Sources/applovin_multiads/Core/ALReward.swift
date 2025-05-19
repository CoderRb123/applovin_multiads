//
//  ALReward.swift
//  applovin_multiads
//
//  Created by Khusnud Zehra on 19/05/25.
//

import AppLovinSDK
import SwiftUI
import MultiAdsInterface

@available(iOS 13.0, *)
class ALReward : UIViewController, @preconcurrency  MARewardedAdDelegate
{
    
    @MainActor static var shared: ALReward = ALReward()
    var adModuleCallBacks: AdModuleWithCallBacks?
  var rewardedAd: MARewardedAd!
  var retryAttempt = 0.0

  func createRewardedAd()
  {
    var placementId: String? = ServerConfig.sharedInstance.adNetworkIds?["applovin"]?.rewardId
    placementId = "0971e0e0696bce3e"
    rewardedAd = MARewardedAd.shared(withAdUnitIdentifier:placementId ?? "")
    rewardedAd.delegate = self

    // Load the first ad
    rewardedAd.load()
  }

  // MARK: MAAdDelegate Protocol

  func didLoad(_ ad: MAAd)
  {
      var placementId: String? = ServerConfig.sharedInstance.adNetworkIds?["applovin"]?.rewardId
      placementId = "0971e0e0696bce3e"
      rewardedAd.show(forPlacement: placementId)
      retryAttempt = 0
  }

  func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError)
  {
      adModuleCallBacks?.onLoadFailed?()
  }

  func didDisplay(_ ad: MAAd) {}

  func didClick(_ ad: MAAd) {}

  func didHide(_ ad: MAAd)
  {
      print("On Did Hide")
//      adModuleCallBacks?.onCloseEvent?()
  }

  func didFail(toDisplay ad: MAAd, withError error: MAError)
  {
     
      adModuleCallBacks?.onFailed?()
  }

  // MARK: MARewardedAdDelegate Protocol

  func didRewardUser(for ad: MAAd, with reward: MAReward)
  {
      print("On Did User")
      adModuleCallBacks?.onCloseEvent?()
  }
}
