
import UIKit

class InitialVC: UIViewController {
    @IBOutlet weak var coinLabel: UILabel!
    let main = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coinLabel.text = "\(GameManagerClass.shared.getCoins())"
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        let vc = main.instantiateViewController(withIdentifier: "LevelsVC") as! LevelsVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func shopTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        let vc = main.instantiateViewController(withIdentifier: "ShopVC") as! ShopVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func achievementTaooed(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        let vc = main.instantiateViewController(withIdentifier: "AchievementsVC") as! AchievementsVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func settingsTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        let vc = main.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func recipesTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        let vc = main.instantiateViewController(withIdentifier: "RecipesVC") as! RecipesVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func howToPlayGotClicked(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        if let passViewCOntroller = main.instantiateViewController(withIdentifier: "HowToPlayViewController") as? HowToPlayViewController {
            navigationController?.pushViewController(passViewCOntroller, animated: true)
        }
    }
}
