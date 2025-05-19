// The Swift Programming Language
// https://docs.swift.org/swift-book


import MultiAdsInterface
import SwiftUICore

@available(iOS 13.0, *)
public class AppLovingNetworkInterface : @preconcurrency NetworkInterface{
    public init(){
        
    }
    
    @MainActor public func initNetwork() -> Bool {
        var sdkKey = ServerConfig.sharedInstance.adNetworkIds?["applovin"]?.configId ?? ""
        sdkKey = "RquLgkFa854L5ZAAkTeJ6xP5ddddlJsOSQRALGKQHJfOT7Fi35Q4OPhV2Wio2aqZu7bQbhwwDnTeBn7HmagGc3"
        MainMethods.shared.initAlSdk(sdkKey: sdkKey)
        return true
    }
    
    public func getAdUnits() -> [Any] {
        return []
    }
    
    public func isNetworkInit() -> Bool {
        return true
    }
    
    public func loadInterAd(adModuleCallBacks: AdModuleWithCallBacks?) {
       
    }
    
    public func showInterAd(adModuleCallBacks: AdModuleWithCallBacks?) {
       
    }
    
    public func isInterAdLoaded() -> Bool {
      return false
    }
    
    @MainActor public func loadAndShowInterAd(adModuleCallBacks: AdModuleWithCallBacks?) {
        let inter = ALInter.shared
        inter.adModuleCallBacks = adModuleCallBacks
        inter.createInterstitialAd()
    }
    
    public func loadRewardAd(adModuleCallBacks: AdModuleWithCallBacks?) {
      
    }
    
    public func showRewardAd(adModuleCallBacks: AdModuleWithCallBacks?) {
      
    }
    
    public func isRewardAdLoaded() -> Bool {
       return false
    }
    
    @MainActor public func loadAndShowRewardAd(adModuleCallBacks: AdModuleWithCallBacks?) {
        let rewards = ALReward.shared
        rewards.adModuleCallBacks = adModuleCallBacks
        rewards.createRewardedAd()
    }
    
    public func loadRewardInter(adModuleCallBacks: AdModuleWithCallBacks?) {
       
    }
    
    public func showRewardInter(adModuleCallBacks: AdModuleWithCallBacks?) {
       
    }
    
    public func isRewardInterAdLoaded() -> Bool {
      
        return false
    }
    
    public func loadAndShowRewardInter(adModuleCallBacks: AdModuleWithCallBacks?) {
       
    }
    
    public func getNativeAd(height: Double?, width: Double?, from: String?) -> ViewWrapper {
        return ViewWrapper(v: VStack{})
    }
    
    public func getBannerAd(from: String?) -> ViewWrapper {
        return ViewWrapper(v: VStack{})
    }
    
    
    
}
