
import UIKit

class RecipesVC: UIViewController {
    @IBOutlet var recipeButtonOutletCollection: [UIButton]!
    let currentLevel = GameManagerClass.shared.getValueOfKey(key: GameManagerClass.shared.level) as! Int
    override func viewDidLoad() {
        super.viewDidLoad()
        for recipeButton in recipeButtonOutletCollection {
            if recipeButton.tag <= currentLevel {
                recipeButton.isUserInteractionEnabled = true
                recipeButton.setBackgroundImage(UIImage(named: "recipe\(recipeButton.tag)"), for: .normal)
            } else {
                recipeButton.isUserInteractionEnabled = false
                recipeButton.setBackgroundImage(UIImage(named: "recipe\(recipeButton.tag)u"), for: .normal)
            }
        }
    }
    @IBAction func recipeGotTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeDescriptionVC") as! RecipeDescriptionVC
        vc.index = sender.tag
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        navigationController?.popToRootViewController(animated: true)
    }
}
