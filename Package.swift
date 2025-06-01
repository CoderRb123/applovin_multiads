// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "applovin_multiads",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "applovin_multiads",
      targets: ["applovin_multiads"])
  ],
  dependencies: [
    .package(
      name: "MultiAdsInterface", url: "https://github.com/CoderRb123/MultiAdsInterface.git",
      branch: "main")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "applovin_multiads",
      dependencies: [
        // Core Dependencies
        "MultiAdsInterface",
        "AppLovinSDKMultiads",
        //Google Adapter
        "GoogleMobileAdsAD",
        "AppLovinMediationGoogleAdapter",
        "UserMessagingPlatformAD",
        
        "AppLovinMediationUnityAdsAdapter",
        
      ]
    ),
    .binaryTarget(
      name: "UserMessagingPlatformAD",
      path: "./Sources/UserMessagingPlatform.xcframework"
    ),
    .binaryTarget(
      name: "GoogleMobileAdsAD",
      path: "./Sources/GoogleMobileAds.xcframework"
    ),
    .binaryTarget(
      name: "AppLovinSDKMultiads",
      path: "./Sources/AppLovinSDK.xcframework"
    ),

    .binaryTarget(
      name: "AppLovinMediationUnityAdsAdapter",
      path: "./Sources/AppLovinMediationUnityAdsAdapter.xcframework"
    ),
    .binaryTarget(
      name: "AppLovinMediationGoogleAdapter",
      path: "./Sources/AppLovinMediationGoogleAdapter.xcframework"
    ),

  ]
)
