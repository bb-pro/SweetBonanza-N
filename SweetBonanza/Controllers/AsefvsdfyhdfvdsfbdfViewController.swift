
import UIKit

class AsefvsdfyhdfvdsfbdfViewController: UIViewController {
    private lazy var blueGrass = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var previousButton = UIButton(type: .system)
    private lazy var nextButton = UIButton(type: .custom)
    private lazy var startButton = UIButton(type: .custom)
    private let progressView = UIImageView()
    private lazy var bigView = UIView()
    private lazy var stadiumImages = UIImageView()
    private let onboardingData = OnboardingItem.getonboardingData()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: blueGrass)
        refressuuuii(forIndex: currentIndex)
        
        startButton.addTarget(self, action: #selector(startButtonGetTapped), for: .touchDown)
        nextButton.addTarget(self, action: #selector(nextButtonGetTapped), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(previousButtonGetTapped), for: .touchUpOutside)
    }
    
    func refressuuuii(forIndex index: Int) {
        if index == 4 {
            previousButton.alpha = 0
            nextButton.alpha = 0
            startButton.alpha = 1
        } else if index == 0{
            previousButton.alpha = 0
            nextButton.alpha = 1
            startButton.alpha = 0
        }else {
            previousButton.alpha = 1
            nextButton.alpha = 1
            startButton.alpha = 0
        }
        let data = onboardingData[index]
        stadiumImages.image = UIImage(named: data.mainImage)
        titleLabel.text = data.titleText
        progressView.image = UIImage(named: data.progressImage)
    }
    func startTabbbb() {
        let tabBarVC = UITabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
    @objc func previousButtonGetTapped() {
        if currentIndex >= 1 {
            currentIndex -= 1
            refressuuuii(forIndex: currentIndex)
        } else{
            previousButton.alpha = 0
        }
    }
    @objc func nextButtonGetTapped() {
        if currentIndex < onboardingData.count - 1 {
            currentIndex += 1
            refressuuuii(forIndex: currentIndex)
        } else{
            startTabbbb()
        }
    }
    @objc func startButtonGetTapped() {
        startTabbbb()
    }
}
