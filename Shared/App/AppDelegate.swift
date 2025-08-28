
import UIKit
import ContentsquareSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        CSQ.debug.logLevel = .info
        CSQ.start()
        CSQ.optIn()
        CSQ.setURLMaskingPatterns([
            "https://httpstatus-mgmt.eu-west-1.csq.io/:status_code/person/:person_id/store/:store_id"
        ])
        CSQ.metadata.onChange { metadata in
            print(metadata.sessionReplayURL?.absoluteString ?? "unknown")
        }

        return true
    }
}

