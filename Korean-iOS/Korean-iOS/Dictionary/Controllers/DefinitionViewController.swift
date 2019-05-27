//
//  DetailController.swift
//  Dictionary 4
//
//  Created by 優しく on 04/05/2018.
//  Copyright © 2018 優しく. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    @IBOutlet weak var sourceTextLabel: UILabel!
    @IBOutlet weak var targetTextLabel: UILabel!
    
    var detailSource:String?
    var detailTarget:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let t = detailSource {
            sourceTextLabel.text = t
            targetTextLabel.text = detailTarget
        }
    }
}
