//
//  NotesViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-22.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
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
