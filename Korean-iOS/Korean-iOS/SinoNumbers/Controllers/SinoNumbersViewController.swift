//
//  ViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class SinoNumbersViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		firstLaunchDefaultValues()
	}
	
	func setInitialValues() {
		let userSettings = UserSettingsDefaults()
		userSettings.defaults.set(100, forKey: userSettings.maxKey)
		userSettings.defaults.set(1, forKey: userSettings.minKey)
	}
	
	final class FirstLaunch {
		
		let wasLaunchedBefore: Bool
		var isFirstLaunch: Bool {
			return !wasLaunchedBefore
		}
		
		init(getWasLaunchedBefore: () -> Bool,
			 setWasLaunchedBefore: (Bool) -> ()) {
			let wasLaunchedBefore = getWasLaunchedBefore()
			self.wasLaunchedBefore = wasLaunchedBefore
			if !wasLaunchedBefore {
				setWasLaunchedBefore(true)
			}
		}
		
		convenience init(userDefaults: UserDefaults, key: String) {
			self.init(getWasLaunchedBefore: { userDefaults.bool(forKey: key) },
					  setWasLaunchedBefore: { userDefaults.set($0, forKey: key) })
		}
	}
	
	func firstLaunchDefaultValues() {
		let userSettings = UserSettingsDefaults()
		let firstLaunch = FirstLaunch(userDefaults: .standard, key: userSettings.wasLaunchedBefore)
		if(firstLaunch.isFirstLaunch) {
			let maxKey = UserSettingsDefaults().maxKey
			let minKey = UserSettingsDefaults().minKey
			let defaults = UserSettingsDefaults().defaults
			// Set default values
			defaults.set(100, forKey: maxKey)
			defaults.set(1, forKey: minKey)
		}
	}
}
