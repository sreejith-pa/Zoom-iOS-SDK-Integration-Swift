//
//  ZoomMeetingService.swift
//  ZoomIntegrationSample
//
//  Created by Sreejith on 20/04/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import Foundation

private struct ZoomConnection {
  // SDK Info for using MobileRTC.
  static let domain = "zoom.us"
  static let appKey = ""
  static let appSecret = ""
  
  // API User info for starting calls as API user.
  static let userID = ""
  static let userToken = ""
  
  // Default display name for meetings.
  static let defaultName = "Anonymous"
}

// MARK: - ZoomAuthService API

class ZoomMeetingService: NSObject, MobileRTCAuthDelegate {
  
  static let sharedInstance = ZoomMeetingService()
  
  var isAPIAuthenticated = false
  var isUserAuthenticated = false
  
  // Authenticates user to use MobileRTC.
  func authenticateSDK() {
    
    var context = MobileRTCSDKInitContext.init()
    context.domain = ZoomConnection.domain
    context.enableLog = true
    
    let _ = MobileRTC.shared().initialize(context)
    
    guard let authService = MobileRTC.shared().getAuthService() else { return }
    authService.delegate = self
    authService.clientKey = ZoomConnection.appKey
    authService.clientSecret = ZoomConnection.appSecret
    authService.sdkAuth()
  }
  
  // Handled by MobileRTCAuthDelegate, returns result of authenticateSDK function call.
  func onMobileRTCAuthReturn(_ returnValue: MobileRTCAuthError) {
    guard returnValue == MobileRTCAuthError_Success else {
      print("Zoom: API authentication task failed, error code: \(returnValue.rawValue)")
      return
    }
    
    isAPIAuthenticated = true
    print("Zoom: API authentication task completed.")
  }
}

