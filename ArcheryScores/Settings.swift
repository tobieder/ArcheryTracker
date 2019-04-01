//
//  Settings.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 31.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class Settings: NSObject, NSCoding {
    
    var email: String
    var passwort: String
    
    var trainerMode: Bool
    var schuetzen: [String]
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("settings")
    
    init?(email: String, passwort: String, trainerMode: Bool) {
        self.email = email
        self.passwort = passwort
        self.trainerMode = trainerMode
        
        schuetzen = []
    }
    
    struct propertyKey {
        static let email = "email"
        static let password = "password"
        static let trainerMode = "trainerMode"
        static let schuetzen = "schuetzen"
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(email, forKey: propertyKey.email)
        aCoder.encode(passwort, forKey: propertyKey.password)
        
        aCoder.encode(trainerMode, forKey: propertyKey.trainerMode)
        aCoder.encode(schuetzen, forKey: propertyKey.schuetzen)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let email = aDecoder.decodeObject(forKey: propertyKey.email) as? String else {
            os_log("Unable to decode the email for a Setting object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let password = aDecoder.decodeObject(forKey: propertyKey.password) as? String else {
            os_log("Unable to decode the password for a Setting object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let trainerMode = aDecoder.decodeBool(forKey: propertyKey.trainerMode)
        
        self.init(email: email, passwort: password, trainerMode: trainerMode)
        
    }
    
}
