import Flutter
import UIKit
import GoogleMaps    
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
       GMSServices.provideAPIKey("AIzaSyD93bQWMV_8zqvHG0ppI0pq_sDqZlPtsL4")  
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
