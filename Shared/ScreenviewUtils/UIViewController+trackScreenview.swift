
import UIKit
import ContentsquareSDK

// We use this convenience extension to send screen views in view controllers.
extension UIViewController {
    func trackScreenview(_ screenName: String) {
        CSQ.trackScreenview(screenName)
    }
}
