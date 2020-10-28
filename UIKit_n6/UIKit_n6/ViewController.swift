//
//  ViewController.swift
//  UIKit_n6
//
//  Created by out-belyayeva-ma on 26.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let playButton = UIButton(type: .custom)
    let durationSlider = UISlider()
    let volumeSlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7071575522, green: 0.5944864154, blue: 0.9584719539, alpha: 1)
        
  
        setAudioPlayer(audioName: "please_don't_go", audioType:  "mp3")
        setPlayButton()
        setDurationSlider()
        setVolumeSlider()
        
    }
    
    private func setAudioPlayer(audioName: String, audioType: String) {
        
        do {
                if let audioPath = Bundle.main.path(forResource: audioName, ofType: audioType) {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    durationSlider.maximumValue = Float(player.duration)
                    volumeSlider.maximumValue = Float(player.volume)
                }
            } catch {
                print("Unable to find audio, try again")
            }
    }
    private func setPlayButton() {
        
        playButton.backgroundColor = #colorLiteral(red: 0.7071575522, green: 0.5944864154, blue: 0.9584719539, alpha: 1)
        playButton.layer.cornerRadius = 40.0
        
        playButton.layer.shadowOpacity = 0.5
        playButton.layer.shadowRadius = 7.0
        playButton.layer.shadowColor = #colorLiteral(red: 0.275506407, green: 0.2962141931, blue: 0.5769214034, alpha: 1)
        playButton.setTitle("Play", for: .normal)
        playButton.sizeToFit()
        playButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        playButton.setTitleColor(#colorLiteral(red: 1, green: 0.9099235136, blue: 0.8521930574, alpha: 1), for: .highlighted)
        playButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    @objc private func playAudio() {
        if player.isPlaying {
            playButton.setTitle("Play", for: .normal)
            player.pause()
        }
        else {
            playButton.setTitle("Pause", for: .normal)
            player.play()
        }
    }
    private func setDurationSlider() {
        
        let durationLabel = UILabel()
        
        durationLabel.text = "Duration"
        durationLabel.textColor = .white
        view.addSubview(durationLabel)
        
        durationSlider.minimumValue = 0.0
        view.addSubview(durationSlider)
        durationSlider.translatesAutoresizingMaskIntoConstraints = false
        durationSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        durationSlider.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -60).isActive = true
        durationSlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        durationSlider.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        durationSlider.addTarget(self, action: #selector(sliderChangeValue), for: .valueChanged)
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.bottomAnchor.constraint(equalTo: durationSlider.topAnchor, constant: -20).isActive = true
        durationLabel.leftAnchor.constraint(equalTo: durationSlider.leftAnchor).isActive = true
        
        
    }
    @objc private func sliderChangeValue(sender: UISlider) {
        if sender == durationSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    private func setVolumeSlider() {
        
        let soundLabel = UILabel()
        
        soundLabel.text = "Volume:"
        soundLabel.textColor = .white
        view.addSubview(soundLabel)
        
        volumeSlider.value = volumeSlider.maximumValue
        volumeSlider.minimumValue = 0.0
        view.addSubview(volumeSlider)
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        volumeSlider.bottomAnchor.constraint(equalTo: durationSlider.topAnchor, constant: -60).isActive = true
        volumeSlider.leftAnchor.constraint(equalTo: durationSlider.leftAnchor).isActive = true
        volumeSlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        volumeSlider.addTarget(self, action: #selector(sliderChangeVolume), for: .valueChanged)
        
        soundLabel.translatesAutoresizingMaskIntoConstraints = false
        soundLabel.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor, constant: -20).isActive = true
        soundLabel.leftAnchor.constraint(equalTo: volumeSlider.leftAnchor).isActive = true
    }
    @objc private func sliderChangeVolume() {
        player.volume = volumeSlider.value
    }
}

