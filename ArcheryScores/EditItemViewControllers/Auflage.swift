//
//  Auflage.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 29.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import Foundation
import UIKit
import os.log


class Auflage: NSObject, NSCoding {
    
    //MARK: Properties
    
    var auflage: UIImage?
    var name: String
    
    init(name: String, auflage: UIImage?) {
        self.name = name
        self.auflage = auflage
    }
    
    struct propertyKey {
        static let name = "name"
        static let auflage = "auflage"
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(auflage, forKey: propertyKey.auflage)
        aCoder.encode(name, forKey: propertyKey.name)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String  else {
            os_log("Unable to decode the name for a result object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let auflage = aDecoder.decodeObject(forKey: propertyKey.auflage) as? UIImage else {
            os_log("Unabel to decode the auflage for a result object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(name: name, auflage: auflage)
    }
}
