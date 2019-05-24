//
//  ViewController.swift
//  Dictionary 4
//
//  Created by 優しく on 09/04/2018.
//  Copyright © 2018 優しく. All rights reserved.
//

import UIKit
import SQLite3


class DictionaryViewController: UIViewController {
	
	var keyboardLanguage:String = "korean"
	var sourceText:String = ""
	var targetText:String = ""
	
	var db: OpaquePointer?
	var dictList = [KorEngDict]()
	
	@IBOutlet weak var tableViewDict: UITableView!
	@IBOutlet weak var searchTextField: UITextField!
	
	@IBAction func textFieldDidChange(_ sender: UITextField) {
		inputLanguage()
		readValues()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//        // Copying Database from the bundle to User folder and opening it
		//        let fileManager = FileManager.default
		//        guard let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
		//        let finalDatabaseURL = documentsUrl.appendingPathComponent("korEngDict.sqlite")
		//
		//        do {
		//            if !fileManager.fileExists(atPath: finalDatabaseURL.path) {
		//                print("DB does not exist in documents folder")
		//
		//                if let dbFilePath = Bundle.main.path(forResource: "korEngDict", ofType: "sqlite") {
		//                    try fileManager.copyItem(atPath: dbFilePath, toPath: finalDatabaseURL.path)
		//                } else {
		//                    print("Uh oh - korEngDict is not in the app bundle")
		//                }
		//            } else {
		//                print("Database file found at path: \(finalDatabaseURL.path)")
		//            }
		//        } catch {
		//            print("Unable to copy korEngDict: \(error)")
		//        }
		//
		//
		//        // Opening Database
		//        if sqlite3_open(finalDatabaseURL.path, &db) != SQLITE_OK {
		//            print("error opening database")
		//        }
		
		readValues()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		// Hiding navigation bar
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
		super.viewWillAppear(animated)
		if let indexPath = tableViewDict.indexPathForSelectedRow {
			tableViewDict.deselectRow(at: indexPath, animated: true)
		}
	}
	
	
	override func viewWillDisappear(_ animated: Bool) {
		// Unhiding navi bar
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
		super.viewWillDisappear(animated)
	}
	
	// Checking input language
	func inputLanguage() {
		if searchTextField.text!.count > 0 {
			let firstLetter = searchTextField.text!.unicodeScalars
			let letterCode: Int!
			letterCode = Int(firstLetter[firstLetter.startIndex].value)
			keyboardLanguage = (letterCode! >= 44023 && letterCode! <= 55215) ? "korean" : "english"
		}
	}
	
	func readValues(){
		
		dictList.removeAll()
		self.tableViewDict.reloadData()
		
		let queryString = (searchTextField.text?.count) != 0 ? "SELECT * FROM korEngDict WHERE " + keyboardLanguage + " LIKE \"" + searchTextField.text! + "%\"" : "SELECT * FROM korEngDict"
		
		// Opening DB from the bundle
		let dbFilePath = Bundle.main.path(forResource: "korEngDict", ofType: "sqlite")
		if sqlite3_open(dbFilePath, &db) != SQLITE_OK {
			print("error opening database")
		}
		
		var stmt: OpaquePointer?
		
		if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("error preparing insert: \(errmsg)")
			print(queryString)
			return
		}
		
		//traversing through all the records
		while(sqlite3_step(stmt) == SQLITE_ROW){
			let id = sqlite3_column_int(stmt, 0)
			let korean = String(cString: sqlite3_column_text(stmt, 1))
			let english = String(cString: sqlite3_column_text(stmt, 2))
			
			//adding values to list
			dictList.append(KorEngDict(id: Int(id), korean: String(korean), english: String(english)))
		}
		self.tableViewDict.reloadData()
	}
	
}

extension DictionaryViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dictList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
		let korEngDict: KorEngDict
		korEngDict = dictList[indexPath.row]
		cell.textLabel?.text = (keyboardLanguage == "korean") ? korEngDict.korean : korEngDict.english
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedText: KorEngDict
		selectedText = dictList[indexPath.row]
		sourceText = (keyboardLanguage == "korean") ? selectedText.korean : selectedText.english
		targetText = (sourceText == selectedText.english) ? selectedText.korean : selectedText.english
		
		performSegue(withIdentifier: "showDetail", sender: nil)
	}
	
	// Method triggered just before segue happens
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let detail = segue.destination as! DefinitionViewController
		detail.detailSource = sourceText
		detail.detailTarget = targetText
		
	}
}

