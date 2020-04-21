# Zoom-iOS-SDK-Integration-Swift
Zoom SDK integrated working swift sample application - This will be helpful to understand effortlessly

This is an very simple veriosn of integrating ZoomSDK into an iOS app. Project is created following the below zoom link.
https://marketplace.zoom.us/docs/sdk/native-sdks/iOS/getting-started , I have added some of appdelegate code which was not mentioned in the document, which leads us into https://devforum.zoom.us/t/zoom-is-not-presenting-meeting-over-controller/7764 issue. 

The Lib files are downloaded from ZoomSDK official repo.
https://github.com/zoom/zoom-sdk-ios/tree/master

# Only runs in devices, this repo has the device related library integrated

The Meeting ID and Password is hardcoded, so please update that before start working.

I have not added any extra UI or activity indicator to keep the sample simple.

Solved : ZoomiOSSDK integration Issue : Meeting UI is not presenting over, the camare is working and the host can see the participant
Just following the documents does make the Meeting UI present, as they are not mentioning about setting rootview controller in the SDK tutorial document.

