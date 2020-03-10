import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    let headerLabel = UILabel()
    let iconLabel = UILabel()
    let nameOfSongLabel = UILabel()
    let timeLeftLabel = UILabel()
    let timeRightLabel = UILabel()
    
    let playlist = ["Пицца-Вторник", "Ленинград-Экспонат", "Ленинград-Белые розы", "Король и Шут-Ром", "Земляне-Поверь в мечту"]
    let icons = ["🎧", "🎹", "🎸", "🎤", "🎻"]
    
    let musicSlider = UISlider()
    let volumeSlider = UISlider()
    
    let playButton = UIButton()
    let prevButton = UIButton()
    let nextButton = UIButton()
    
    var numberOfSong = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.69, blue: 0.62, alpha: 1)
        editLabel(label: headerLabel, text: "Плейлист", x: 0, y: 90, width: Int(view.frame.width), height: 70, size: 50.0)
        
        editLabel(label: iconLabel, text: "", x: 50, y: 200, width: 310, height: 310, size: 150.0)
        iconLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        editLabel(label: nameOfSongLabel, text: "", x: 70, y: 540, width: 310, height: 40, size: 30.0)
        
        editSlider(slider: musicSlider, x: 70, y: 600, width: 250)
        musicSlider.minimumValue = 0.0
        musicSlider.maximumValue = 100.0
        editLabel(label: timeLeftLabel, text: "00.00", x: 10, y: 600, width: 70, height: 20, size: 20.0)
        editLabel(label: timeRightLabel, text: "", x: 340, y: 600, width: 70, height: 20, size: 20.0)
        
        editButton(button: prevButton, text: "prev.png", x: 50)
        editButton(button: playButton, text: "pause.png", x: 170)
        editButton(button: nextButton, text: "next.png", x: 290)
        
        editSlider(slider: volumeSlider, x: 70, y: 750, width: 270)
        volumeSlider.value = 0.5
        
        playButton.addTarget(self, action: #selector(playButtonIsPressed(_:)), for: .touchUpInside)
        musicSlider.addTarget(self, action: #selector(musicSliderIsChanged(sender:)), for: .valueChanged)
        volumeSlider.addTarget(self, action: #selector(volumeSliderIsChanged(sender:)), for: .valueChanged)
        nextButton.addTarget(self, action: #selector(nextButtonIsPressed(_:)), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(prevButtonIsPressed(_:)), for: .touchUpInside)
        
        music()
    }
    
    func music() {
        do {
            if let audioPath = Bundle.main.path(forResource: "\(playlist[numberOfSong])", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                musicSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        
        timeRightLabel.text = timeText(sender: player.duration)
        timeLeftLabel.text = timeText(sender: player.currentTime)
        playButton.setImage(UIImage(named: "pause.png") , for: UIControl.State.normal)
        playButton.frame = CGRect(x: 170, y: 640, width: 70, height: 70)
        iconLabel.text = icons[numberOfSong]
        nameOfSongLabel.text = playlist[numberOfSong]
        player.play()
    }
    
    @objc func playButtonIsPressed(_: UIButton) {
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(named: "play.png") , for: UIControl.State.normal)
            playButton.frame = CGRect(x: 170, y: 640, width: 74, height: 70)
        } else {
            player.play()
            playButton.setImage(UIImage(named: "pause.png") , for: UIControl.State.normal)
            playButton.frame = CGRect(x: 170, y: 640, width: 70, height: 70)
        }
    }
    
    @objc func nextButtonIsPressed(_: UIButton) {
        player.stop()
        if numberOfSong == (playlist.count - 1) {
            numberOfSong = 0
        } else {
            numberOfSong += 1
            musicSlider.value = 0
        }
        music()
    }
    
    @objc func prevButtonIsPressed(_: UIButton) {
        player.stop()
        if numberOfSong == 0 {
            numberOfSong = (playlist.count - 1)
        } else {
            numberOfSong -= 1
            musicSlider.value = 0
        }
        music()
    }
    
    func timeText(sender: TimeInterval) -> String {
        let currentTime = Int(sender)
        let min = currentTime/60
        let sec = currentTime - min * 60
        
        return (NSString(format: "%02d:%02d", min, sec) as String)
    }
    
    @objc func musicSliderIsChanged(sender: UISlider) {
        if sender == musicSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @objc func volumeSliderIsChanged (sender: UISlider) {
        if sender == volumeSlider {
            player.volume = sender.value
        }
    }
    
    func editLabel(label: UILabel, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat) {
        label.text = text
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.font = UIFont(name: "Arial", size: size)
        label.textAlignment = .center
        view.addSubview(label)
    }
    func editSlider(slider: UISlider, x: Int, y: Int, width: Int) {
        slider.frame = CGRect(x: x, y: y, width: width, height: 20)
        slider.minimumTrackTintColor = UIColor(red: 1, green: 0.46, blue: 0.45, alpha: 1)
        slider.thumbTintColor = UIColor(red: 1, green: 0.46, blue: 0.45, alpha: 1)
        view.addSubview(slider)
    }
    
    func editButton(button: UIButton, text: String, x: Int) {
        button.frame = CGRect(x: x, y: 640, width: 70, height: 70)
        let btnImage = UIImage(named: text)
        button.setImage(btnImage , for: UIControl.State.normal)
        button.backgroundColor = UIColor(red: 0.98, green: 0.69, blue: 0.62, alpha: 1)
        view.addSubview(button)
    }

}

