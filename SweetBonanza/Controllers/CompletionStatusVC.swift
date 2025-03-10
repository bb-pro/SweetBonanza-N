
import UIKit

class CompletionStatusVC: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wonCoinLabel: UILabel!
    @IBOutlet weak var cakeImageView: UIImageView!
    @IBOutlet weak var winSubtitleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var failSubTitle: UILabel!
    
    var level: Int?
    var particleImage: UIImage?
    var instructionText: String?
    var isWon: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUsedAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AudioController.shared.stopBackgroundMusic()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AudioController.shared.playBackgroundMusic()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        AudioController.shared.playClickSound()
        if let isWon = isWon  {
            if level! < 11 {
                let vc = storyboard?.instantiateViewController(withIdentifier: "MainGameVC") as! MainGameVC
                vc.level = isWon ? (level! + 1) : level
                navigationController?.pushViewController(vc, animated: true)
            } else {
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}
private extension CompletionStatusVC {
    private func setupUsedAppearance() {
        if let level = level, let particleImage = particleImage, let instructionText = instructionText, let isWon = isWon {
            wonCoinLabel.text = isWon ? "+132" : "+0"
            infoLabel.text = instructionText
            fruitImageView.image = particleImage
            titleLabel.text = isWon ? "you have passed the level" : "You failed the level"
            let image = isWon ? UIImage(named: "recipe\(level)") : nil
            cakeImageView.image = image
            cakeImageView.isHidden = !isWon
            winSubtitleLabel.isHidden = !isWon
            failSubTitle.isHidden = isWon
            let img = isWon ? UIImage(named: "nextBtn") : UIImage(named: "restartBtn")
            nextButton.setBackgroundImage(img, for: .normal)
            let addedValue: Int = isWon ? 132 : 0
            GameManagerClass.shared.updateValues(key: GameManagerClass.shared.coins,
                                                 value: GameManagerClass.shared.getCoins() + addedValue)
            if isWon && level == (GameManagerClass.shared.getLevel()) && level < 11 {
                GameManagerClass.shared.updateValues(key: GameManagerClass.shared.level,
                                                     value: (level + 1))
            }
        }
    }
}
