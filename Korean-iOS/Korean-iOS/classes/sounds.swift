//
//  sounds.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit
import AVFoundation

class sounds: NSObject {
	var audioPlayer: AVAudioPlayer?
	
	func playCorrectSound() {
		do {
			if let correctSoundURL = Bundle.main.path(forResource: "correct", ofType: "wav") {
				audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: correctSoundURL))
				audioPlayer?.play()
			} else {
				print("Correct audio not found")
			}
		} catch let errorFailedToPlayAudioCorrect {
			print("Correct audio file failed to play \(errorFailedToPlayAudioCorrect.localizedDescription)")
		}
	}
	
	func playIncorrectSound() {
		do {
			if let incorrectSoundURL = Bundle.main.path(forResource: "incorrect", ofType: "wav") {
				audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: incorrectSoundURL))
				audioPlayer?.play()
			} else {
				print("Incorrect audio not found")
			}
		} catch let errorFailedToPlayAudioCorrect {
			print("Incorrect audio file failed to play \(errorFailedToPlayAudioCorrect.localizedDescription)")
		}
	}
}
