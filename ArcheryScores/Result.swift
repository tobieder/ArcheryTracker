//
//  Result.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 11.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class Result: NSObject, NSCoding{
    
    //MARK: Properties
    
    var name: String
    var date: Date
    
    var result: Int
    
    var auflage: Auflage
    
    var round1_result: Int
    var round2_result: Int
    var round3_result: Int
    var round4_result: Int
    var round5_result: Int
    var round6_result: Int
    
    var round1_image: UIImage?
    var round2_image: UIImage?
    var round3_image: UIImage?
    var round4_image: UIImage?
    var round5_image: UIImage?
    var round6_image: UIImage?
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("results")
    
    
    //MARK: Initialization
    
    init?(name: String, date: Date, auflage: Auflage, round1_result: Int, round1_image: UIImage?, round2_result: Int, round2_image: UIImage?, round3_result: Int, round3_image: UIImage?, round4_result: Int, round4_image: UIImage?, round5_result: Int, round5_image: UIImage?, round6_result: Int, round6_image: UIImage?) {
        
        // The name must not be empty.
        guard !name.isEmpty else {
            return nil
        }
        
        // The result must be between 0 and 60 incluively.
        guard (round1_result >= 0) && (round1_result <= 60) else {
            return nil
        }
        
        self.name = name
        self.date = date
        
        self.auflage = auflage
        
        self.round1_result = round1_result
        self.round1_image = round1_image
        self.round2_result = round2_result
        self.round2_image = round2_image
        self.round3_result = round3_result
        self.round3_image = round3_image
        self.round4_result = round4_result
        self.round4_image = round4_image
        self.round5_result = round5_result
        self.round5_image = round5_image
        self.round6_result = round6_result
        self.round6_image = round6_image
        
        self.result = self.round1_result + self.round2_result + self.round3_result + self.round4_result + self.round5_result + self.round6_result
        
    }
    
    //MARK: Types
    
    struct propertyKey {
        
        static let name = "name"
        static let date = "date"
        
        static let auflage = "auflage"
        
        static let round1_result = "round1_result"
        static let round2_result = "round2_result"
        static let round3_result = "round3_result"
        static let round4_result = "round4_result"
        static let round5_result = "round5_result"
        static let round6_result = "round6_result"
        
        static let round1_image = "round1_image"
        static let round2_image = "round2_image"
        static let round3_image = "round3_image"
        static let round4_image = "round4_image"
        static let round5_image = "round5_image"
        static let round6_image = "round6_image"
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: propertyKey.name)
        aCoder.encode(date, forKey: propertyKey.date)
        
        aCoder.encode(auflage, forKey: propertyKey.auflage)
        
        aCoder.encode(round1_result, forKey: propertyKey.round1_result)
        aCoder.encode(round2_result, forKey: propertyKey.round2_result)
        aCoder.encode(round3_result, forKey: propertyKey.round3_result)
        aCoder.encode(round4_result, forKey: propertyKey.round4_result)
        aCoder.encode(round5_result, forKey: propertyKey.round5_result)
        aCoder.encode(round6_result, forKey: propertyKey.round6_result)
        
        aCoder.encode(round1_image, forKey: propertyKey.round1_image)
        aCoder.encode(round2_image, forKey: propertyKey.round2_image)
        aCoder.encode(round3_image, forKey: propertyKey.round3_image)
        aCoder.encode(round4_image, forKey: propertyKey.round4_image)
        aCoder.encode(round5_image, forKey: propertyKey.round5_image)
        aCoder.encode(round6_image, forKey: propertyKey.round6_image)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String else {
            os_log("Unable to decode the name for a Result object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let date = aDecoder.decodeObject(forKey: propertyKey.date) as! Date
        let auflage = aDecoder.decodeObject(forKey: propertyKey.auflage) as! Auflage
        
        
        let round1_result = aDecoder.decodeInteger(forKey: propertyKey.round1_result)
        let round2_result = aDecoder.decodeInteger(forKey: propertyKey.round2_result)
        let round3_result = aDecoder.decodeInteger(forKey: propertyKey.round3_result)
        let round4_result = aDecoder.decodeInteger(forKey: propertyKey.round4_result)
        let round5_result = aDecoder.decodeInteger(forKey: propertyKey.round5_result)
        let round6_result = aDecoder.decodeInteger(forKey: propertyKey.round6_result)
        
        let round1_image = aDecoder.decodeObject(forKey: propertyKey.round1_image) as? UIImage
        let round2_image = aDecoder.decodeObject(forKey: propertyKey.round2_image) as? UIImage
        let round3_image = aDecoder.decodeObject(forKey: propertyKey.round3_image) as? UIImage
        let round4_image = aDecoder.decodeObject(forKey: propertyKey.round4_image) as? UIImage
        let round5_image = aDecoder.decodeObject(forKey: propertyKey.round5_image) as? UIImage
        let round6_image = aDecoder.decodeObject(forKey: propertyKey.round6_image) as? UIImage
        
        
        self.init(name: name, date: date, auflage: auflage, round1_result: round1_result, round1_image: round1_image, round2_result: round2_result, round2_image: round2_image, round3_result: round3_result, round3_image: round3_image, round4_result: round4_result, round4_image: round4_image, round5_result: round5_result, round5_image: round5_image, round6_result: round6_result, round6_image: round6_image)
    }
    
}
