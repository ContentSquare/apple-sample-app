import UIKit
import ContentsquareSDK

// This class showcases how to use privacy-related APIs. You are responsible for creating the UI asking the user for his consent, and then calling the appropriate Contentsquare function.
class PrivacyViewController: UIViewController {

    @IBOutlet private weak var commandTitle: UILabel!
    @IBOutlet private weak var commandMessage: UILabel!

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        commandTitle.text = ""
        commandMessage.text = ""
    }

    //MARK: - UI Actions

    @IBAction private func optOutButtonTapped(_ sender: UIButton)
    {
        CSQ.optOut()
        displayCommand(title: "User opted out", message: "The user is no longer being tracked. The User ID has been deleted, and no more data will be collected.")
    }
    
    @IBAction private func optInButtonTapped(_ sender: UIButton)
    {
        CSQ.optIn()
        displayCommand(title: "User opted in", message: "The user is now being tracked, and a new User ID has been generated.")
    }

    @IBAction private func stopButtonTapped(_ sender: UIButton)
    {
        CSQ.pauseTracking()
        displayCommand(title: "Tracking stopped", message: "The tracking is stopped until next app launch, or until a call to resumeTracking()")
    }
    
    @IBAction private func resumeButtonTapped(_ sender: UIButton)
    {
        CSQ.resumeTracking()
        displayCommand(title: "Tracking resumed", message: "The tracking is back!")
        CSQ.debug.logLevel = .info
    }

    @IBAction private func IDButtonTapped(_ sender: UIButton)
    {
        let id = CSQ.metadata.userID
        displayCommand(title: "User ID", message: "The User ID is \(id ?? "undefined.")")
    }

    //MARK: - Private

    private func displayCommand(title: String?, message: String?)
    {
        commandTitle.text = title
        commandMessage.text = message
    }
}
