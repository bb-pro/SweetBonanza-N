
import UIKit
import AVFoundation

class AudioController {
    static let shared = AudioController()
    
    private var backgroundPlayer: AVAudioPlayer?
    private var losePlayer: AVAudioPlayer?
    private var clickPlayer: AVAudioPlayer?
    private var winPlayer: AVAudioPlayer?
    
    private var soundVolume: Float = 1.0
    private var musicVolume: Float = 1.0
    
    private init() {
        loadVolumes()
        initializeAudioPlayers()
    }
    
    private func loadVolumes() {
        soundVolume = (GameManagerClass.shared.getValueOfKey(key: GameManagerClass.shared.soundVolume) as? NSNumber)?.floatValue ?? 1.0
        musicVolume = (GameManagerClass.shared.getValueOfKey(key: GameManagerClass.shared.musicVolume) as? NSNumber)?.floatValue ?? 1.0
    }
    
    private func initializeAudioPlayers() {
        backgroundPlayer = loadPlayer(forResource: "bg", volume: musicVolume, loops: -1)
        losePlayer = loadPlayer(forResource: "lose", volume: musicVolume)
        winPlayer = loadPlayer(forResource: "win", volume: musicVolume)
        clickPlayer = loadPlayer(forResource: "click", volume: soundVolume)
    }
    
    private func loadPlayer(forResource name: String, volume: Float, loops: Int = 0) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return nil }
        let player = try? AVAudioPlayer(contentsOf: url)
        player?.volume = volume
        player?.numberOfLoops = loops
        player?.prepareToPlay()
        return player
    }
    
    func playBackgroundMusic() {
        backgroundPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
    
    func playClickSound() {
        clickPlayer?.play()
    }
    
    func playLoseSound() {
        losePlayer?.play()
    }
    
    func playWinSound() {
        winPlayer?.play()
    }
    
    func setMusicVolume(_ volume: Float) {
        musicVolume = volume
        updateMusicVolumes()
        GameManagerClass.shared.updateValues(key: GameManagerClass.shared.musicVolume, value: volume)
    }
    
    private func updateMusicVolumes() {
        backgroundPlayer?.volume = musicVolume
        losePlayer?.volume = musicVolume
        winPlayer?.volume = musicVolume
    }
    
    func setSoundVolume(_ volume: Float) {
        soundVolume = volume
        clickPlayer?.volume = volume
        GameManagerClass.shared.updateValues(key: GameManagerClass.shared.soundVolume, value: volume)
    }
    
    func restartBackgroundMusic() {
        stopBackgroundMusic()
        playBackgroundMusic()
    }
    
    func fadeOutBackgroundMusic(duration: TimeInterval = 1.0) {
        guard let player = backgroundPlayer else { return }
        Timer.scheduledTimer(withTimeInterval: duration / 10, repeats: true) { timer in
            if player.volume > 0 {
                player.volume -= self.musicVolume / 10
            } else {
                player.stop()
                player.volume = self.musicVolume
                timer.invalidate()
            }
        }
    }
    
    func isBackgroundMusicPlaying() -> Bool {
        return backgroundPlayer?.isPlaying ?? false
    }
}
