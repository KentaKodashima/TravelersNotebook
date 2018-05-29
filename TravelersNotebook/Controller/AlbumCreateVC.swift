//
//  AlbumCreateVC.swift
//  TravelersNotebook
//
//  Created by Kenta Kodashima on 2018-05-27.
//  Copyright © 2018 Kenta Kodashima. All rights reserved.
//

import UIKit

class AlbumCreateVC: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var albumTitleField: UITextField!
  @IBOutlet weak var albumTitleTable: UITableView!
  
  var albumTitles = [String]()
  var tempString: String?
  var testStrings = ["John", "Paul", "Ringo", "George"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.albumTitleField.delegate = self
    albumTitleTable.isHidden = true
    
    albumTitles.append(contentsOf: testStrings)
  }
  
  // 
  @IBAction func createButtonTapped(_ sender: UIButton) {
    if let albumTitleFieldText = albumTitleField.text {
      albumTitles.append(albumTitleField.text!)
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    albumTitleField.resignFirstResponder()
    return true
  }
  
  
  
}

extension AlbumCreateVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //return albumTitles.count
    return testStrings.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AlbumTitleCell
    //cell.albumTitle.text = albumTitles[indexPath.row]
    cell.albumTitle.text = testStrings[indexPath.row]
    
    albumTitleTable.isHidden = false
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Unwind" {
      let cell = sender as! UITableViewCell
      let index = albumTitleTable.indexPath(for: cell)
      if let indexPath = index?.row {
        tempString = testStrings[indexPath]
      }
    }
  }
  
}