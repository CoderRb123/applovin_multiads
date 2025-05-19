//
//  ALInter.swift
//  applovin_multiads
//
//  Created by Khusnud Zehra on 19/05/25.
//


import AppLovinSDK
import SwiftUI
import MultiAdsInterface

@available(iOS 13.0, *)
class ALInter: UIViewController, @preconcurrency MAAdDelegate
{
    @MainActor static var shared: ALInter = ALInter()
    var adModuleCallBacks: AdModuleWithCallBacks?

    var interstitialAd: MAInterstitialAd!
    var retryAttempt = 0.0
   
    
  func createInterstitialAd()
  {
    var placementId: String? = ServerConfig.sharedInstance.adNetworkIds?["applovin"]?.interId
    placementId = "dd6ae7075e4cbfb9"
    interstitialAd = MAInterstitialAd(adUnitIdentifier: placementId ?? "")
    interstitialAd.delegate = self
    // Load the first ad
    interstitialAd.load()
  }

  // MARK: MAAdDelegate Protocol

  func didLoad(_ ad: MAAd)
  {
    var placementId: String? = ServerConfig.sharedInstance.adNetworkIds?["applovin"]?.interId
    placementId = "dd6ae7075e4cbfb9"
    interstitialAd.show(forPlacement: placementId)
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
      print("On Ad Dismiss")
      adModuleCallBacks?.onCloseEvent?()
   
  }

  func didFail(toDisplay ad: MAAd, withError error: MAError)
  {
    // Interstitial ad failed to display. AppLovin recommends that you load the next ad.
    interstitialAd.load()
  }
}
