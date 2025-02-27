
import Foundation

class GameManagerClass {
    static let shared = GameManagerClass()
    private let defaults = UserDefaults.standard
    
    // Keys
    let coins = "coins"
    let level = "level"
    let availableBackground = "availableBackground"
    let selectedBackgroud = "selectedBackgroud"
    let achievements = "achievements"
    let unbeatenMoves = "unbeatedMoves"
    let soundVolume = "soundVolume"
    let musicVolume = "musicVolume"
    
    private init() {
        initializeUserInformation()
    }
    
    /// Initializes default user data if not already set
    func initializeUserInformation() {
        setDefaultValue(forKey: coins, value: 60)
        setDefaultValue(forKey: level, value: 0)
        setDefaultValue(forKey: availableBackground, value: [0])
        setDefaultValue(forKey: selectedBackgroud, value: 0)
        setDefaultValue(forKey: achievements, value: [0])
        setDefaultValue(forKey: unbeatenMoves, value: 0)
        setDefaultValue(forKey: soundVolume, value: 1.0)
        setDefaultValue(forKey: musicVolume, value: 1.0)
    }
    
    /// Sets a value only if the key does not already exist
    private func setDefaultValue(forKey key: String, value: Any) {
        if defaults.value(forKey: key) == nil {
            defaults.set(value, forKey: key)
        }
    }
    
    /// Updates the value of a given key
    func updateValues(key: String, value: Any) {
        defaults.set(value, forKey: key)
    }
    
    /// Retrieves the value of a given key
    func getValueOfKey(key: String) -> Any? {
        return defaults.value(forKey: key)
    }
    
    /// Retrieves multiple values at once
    func getValues(forKeys keys: [String]) -> [String: Any] {
        var values: [String: Any] = [:]
        for key in keys {
            if let value = defaults.value(forKey: key) {
                values[key] = value
            }
        }
        return values
    }
    
    /// Retrieves the number of coins
    func getCoins() -> Int {
        return defaults.integer(forKey: coins)
    }
    
    /// Adds coins
    func addCoins(amount: Int) {
        let newTotal = getCoins() + amount
        defaults.set(newTotal, forKey: coins)
    }
    
    /// Deducts coins
    func removeCoins(amount: Int) {
        let newTotal = max(0, getCoins() - amount)
        defaults.set(newTotal, forKey: coins)
    }
    
    /// Retrieves the current level
    func getLevel() -> Int {
        return defaults.integer(forKey: level)
    }
    
    /// Increases the level
    func levelUp() {
        let newLevel = getLevel() + 1
        defaults.set(newLevel, forKey: level)
    }
    
    /// Decreases the level
    func levelDown() {
        let newLevel = max(0, getLevel() - 1)
        defaults.set(newLevel, forKey: level)
    }
    
    /// Checks if a key exists in UserDefaults
    func doesKeyExist(_ key: String) -> Bool {
        return defaults.value(forKey: key) != nil
    }
    
    /// Resets all user data to defaults
    func resetUserData() {
        defaults.removeObject(forKey: coins)
        defaults.removeObject(forKey: level)
        defaults.removeObject(forKey: availableBackground)
        defaults.removeObject(forKey: selectedBackgroud)
        defaults.removeObject(forKey: achievements)
        defaults.removeObject(forKey: unbeatenMoves)
        defaults.removeObject(forKey: soundVolume)
        defaults.removeObject(forKey: musicVolume)
        initializeUserInformation()
    }
    
    /// Retrieves all unlocked backgrounds
    func getAvailableBackgrounds() -> [Int] {
        return defaults.array(forKey: availableBackground) as? [Int] ?? []
    }
    
    /// Unlocks a new background
    func unlockBackground(_ backgroundID: Int) {
        var backgrounds = getAvailableBackgrounds()
        if !backgrounds.contains(backgroundID) {
            backgrounds.append(backgroundID)
            defaults.set(backgrounds, forKey: availableBackground)
        }
    }
    
    /// Retrieves all achievements
    func getAchievements() -> [Int] {
        return defaults.array(forKey: achievements) as? [Int] ?? []
    }
    
    /// Adds an achievement if not already unlocked
    func unlockAchievement(_ achievementID: Int) {
        var achiev = getAchievements()
        if !achiev.contains(achievementID) {
            achiev.append(achievementID)
            defaults.set(achiev, forKey: achievements)
        }
    }
    
    /// Retrieves sound and music volume levels
    func getSoundVolume() -> Double {
        return defaults.double(forKey: soundVolume)
    }
    
    func getMusicVolume() -> Double {
        return defaults.double(forKey: musicVolume)
    }
    
    /// Updates sound volume
    func setSoundVolume(_ volume: Double) {
        defaults.set(volume, forKey: soundVolume)
    }
    
    /// Updates music volume
    func setMusicVolume(_ volume: Double) {
        defaults.set(volume, forKey: musicVolume)
    }
}
