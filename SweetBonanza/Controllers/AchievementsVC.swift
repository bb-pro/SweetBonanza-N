
import UIKit

class AchievementsVC: UIViewController {
    @IBOutlet var achievementImages: [UIImageView]!
    @IBOutlet var viewsToSetBorder: [UIView]!
    
    let achievements = GameManagerClass.shared.getAchievements()
    override func viewDidLoad() {
        super.viewDidLoad()
        for achievementImage in achievementImages {
            if achievements.contains(achievementImage.tag) {
                achievementImage.image = UIImage(named: "selectedAchievement")
            } else {
                achievementImage.image = UIImage(named: "unselectedAchievement")
            }
        }
        
        for vw in viewsToSetBorder {
            vw.layer.borderWidth = 2.0
            vw.layer.borderColor = UIColor(red: 153/255, green: 0, blue: 150/255, alpha: 1).cgColor
        }
    }
    @IBAction func backTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        navigationController?.popToRootViewController(animated: true)
    }
}
