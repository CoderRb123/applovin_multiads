//
//  ALReward.swift
//  applovin_multiads
//
//  Created by Khusnud Zehra on 19/05/25.
//

import AppLovinSDK
import SwiftUI

class ALReward : UIViewController, @preconcurrency  MARewardedAdDelegate
{
  var rewardedAd: MARewardedAd!
  var retryAttempt = 0.0

  func createRewardedAd()
  {
    rewardedAd = MARewardedAd.shared(withAdUnitIdentifier: "«ad-unit-ID»")
    rewardedAd.delegate = self

    // Load the first ad
    rewardedAd.load()
  }

  // MARK: MAAdDelegate Protocol

  func didLoad(_ ad: MAAd)
  {
    // Rewarded ad is ready to show. '[self.rewardedAd isReady]' now returns 'YES'.

    // Reset retry attempt
    retryAttempt = 0
  }

  func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError)
  {
    // Rewarded ad failed to load
    // AppLovin recommends that you retry with exponentially higher delays up to a maximum delay (in this case 64 seconds).

    retryAttempt += 1
    let delaySec = pow(2.0, min(6.0, retryAttempt))

    DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
      self.rewardedAd.load()
    }
  }

  func didDisplay(_ ad: MAAd) {}

  func didClick(_ ad: MAAd) {}

  func didHide(_ ad: MAAd)
  {
    // Rewarded ad is hidden. Pre-load the next ad
    rewardedAd.load()
  }

  func didFail(toDisplay ad: MAAd, withError error: MAError)
  {
    // Rewarded ad failed to display. AppLovin recommends that you load the next ad.
    rewardedAd.load()
  }

  // MARK: MARewardedAdDelegate Protocol

  func didRewardUser(for ad: MAAd, with reward: MAReward)
  {
    // Rewarded ad was displayed and user should receive the reward
  }
}
