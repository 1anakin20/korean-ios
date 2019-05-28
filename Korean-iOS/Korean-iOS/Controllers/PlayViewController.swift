//
//  PlayViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-22.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		firstLaunchDefaultValues()
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
			let sinoMaxKey = UserSettingsDefaults().maxKey
			let sinoMinKey = UserSettingsDefaults().minKey
			// Set default values
			UserSettingsDefaults().defaults.set(100, forKey: sinoMaxKey)
			UserSettingsDefaults().defaults.set(1, forKey: sinoMinKey)
			
			// Native numbers
			let nativeUserSettings = NativeUserDefaults()
			let nativeMaxKey = nativeUserSettings.nativeMaxKey
			let nativeMinKey = nativeUserSettings.nativeMinKey
			// Set default values
			NativeUserDefaults().defaults.set(99, forKey: nativeMaxKey)
			NativeUserDefaults().defaults.set(1, forKey: nativeMinKey)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: false)
	}
}
