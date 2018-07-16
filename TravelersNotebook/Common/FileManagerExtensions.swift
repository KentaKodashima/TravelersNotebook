//
//  FileManagementHelper.swift
//  TravelersNotebook
//
//  Created by Kenta Kodashima on 2018-07-14.
//  Copyright © 2018 Kenta Kodashima. All rights reserved.
//

import Foundation
import UIKit

extension FileManager {
  static var documentDirectory: URL {
    return FileManager
      .default
      .urls(for: .documentDirectory, in: .userDomainMask)
      .first!
  }
}
