
import UIKit

class HowToPlayViewController: UIViewController {

    var pushOnboarding: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if pushOnboarding {
            pushOnboarding = false
            let vc = AsefvsdfyhdfvdsfbdfViewController()
            
        }
    }

    @IBAction func returnToBackButton(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        navigationController?.popToRootViewController(animated: true)
    }
}
