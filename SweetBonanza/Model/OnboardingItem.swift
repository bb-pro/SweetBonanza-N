
import UIKit

struct OnboardingItem{
    let mainImage,progressImage, titleText: String
    static func getonboardingData() -> [OnboardingItem] {
        [
            OnboardingItem(
                mainImage: "Ellipse1",
                progressImage: "Frame1",
                titleText: "The Legacy of \nItalian Serie A"
            ),
                OnboardingItem(
                mainImage: "Ellipse2",
                progressImage: "Frame2",
                titleText: "Legendary Rivalries in Serie A"
                ),
            OnboardingItem(
                mainImage: "Ellipse3",
                progressImage: "Frame3",
                titleText: "Series A teams"
            ),
            OnboardingItem(
                mainImage: "Ellipse4",
                progressImage: "Frame4",
                titleText: "Match Recording"
            ),
            OnboardingItem(
                mainImage: "Ellipse5",
                progressImage: "Frame5",
                titleText: "ProTeam track"
            )
           
        ]
    }
    
}
