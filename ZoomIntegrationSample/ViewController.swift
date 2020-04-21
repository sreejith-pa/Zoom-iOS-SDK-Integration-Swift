//
//  ViewController.swift
//  ZoomIntegrationSample
//
//  Created by Sreejith on 20/04/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MobileRTCMeetingServiceDelegate  {
    
    @IBOutlet weak var joinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func joinMeeting() {
//        // Fill meeting into which you have to join
//        self.joinMeeting(name:"", number: , password: "")
    }
    
    func joinMeeting(name: String = "Anonymous", number: Int, password: String = "") {
        guard ZoomMeetingService.sharedInstance.isAPIAuthenticated || ZoomMeetingService.sharedInstance.isUserAuthenticated, let meetingService = MobileRTC.shared().getMeetingService() else { return }
        
        var paramDict: [String : Any] = [
            kMeetingParam_Username : name,
            kMeetingParam_MeetingNumber : "\(number)"
        ]
        
        if password.count > 0 {
            paramDict[kMeetingParam_MeetingPassword] = password
        }
        
        meetingService.delegate = self
        
        let returnValue = meetingService.joinMeeting(with: paramDict)
        
        guard returnValue == MobileRTCMeetError_Success else {
            print("Zoom: Join meeting task failed, error code: \(returnValue.rawValue)")
            return
        }
        
        print("Zoom: Join meeting task completed.")
    }
}

