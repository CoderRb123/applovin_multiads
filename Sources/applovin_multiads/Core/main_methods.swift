//
//  main_methods.swift
//  applovin_multiads
//
//  Created by Khusnud Zehra on 18/05/25.
//





import AppLovinSDK


class MainMethods  {
    
    @MainActor static var shared: MainMethods = MainMethods()

    func initAlSdk(sdkKey: String) {
        let initConfig = ALSdkInitializationConfiguration(sdkKey: sdkKey) { builder in

          builder.mediationProvider = ALMediationProviderMAX
            builder.segmentCollection = MASegmentCollection { segmentCollectionBuilder in
                segmentCollectionBuilder.add(MASegment(key: 849, values: [1, 3]))
              }

        }
        let settings = ALSdk.shared().settings
        settings.termsAndPrivacyPolicyFlowSettings.isEnabled = true
        settings.termsAndPrivacyPolicyFlowSettings.termsOfServiceURL = URL(string: "https://dailyrewardlinks.com/about-us")
        settings.termsAndPrivacyPolicyFlowSettings.privacyPolicyURL = URL(string: "https://dailyrewardlinks.com/privacy-policy")
        ALSdk.shared().initialize(with: initConfig) { sdkConfig in
            // Start loading ads
            print("AppLovin Sdk Configured")
            print(sdkConfig.description)
          }
    }
}
