//
//  GesamtergebnisTableViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 31.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit

class GesamtergebnisTableViewController: UITableViewController {

    var result: Result?
    
    @IBOutlet weak var arrow1_1: UILabel!
    @IBOutlet weak var arrow1_2: UILabel!
    @IBOutlet weak var arrow1_3: UILabel!
    @IBOutlet weak var partialResult1_1: UILabel!
    @IBOutlet weak var arrow1_4: UILabel!
    @IBOutlet weak var arrow1_5: UILabel!
    @IBOutlet weak var arrow1_6: UILabel!
    @IBOutlet weak var partialResult1_2: UILabel!
    @IBOutlet weak var roundResult1: UILabel!
    @IBOutlet weak var uebertrag1: UILabel!
    
    
    @IBOutlet weak var arrow2_1: UILabel!
    @IBOutlet weak var arrow2_2: UILabel!
    @IBOutlet weak var arrow2_3: UILabel!
    @IBOutlet weak var partialResult2_1: UILabel!
    @IBOutlet weak var arrow2_4: UILabel!
    @IBOutlet weak var arrow2_5: UILabel!
    @IBOutlet weak var arrow2_6: UILabel!
    @IBOutlet weak var partialResult2_2: UILabel!
    @IBOutlet weak var roundResult2: UILabel!
    @IBOutlet weak var uebertrag2: UILabel!
    
    @IBOutlet weak var arrow3_1: UILabel!
    @IBOutlet weak var arrow3_2: UILabel!
    @IBOutlet weak var arrow3_3: UILabel!
    @IBOutlet weak var partialResult3_1: UILabel!
    @IBOutlet weak var arrow3_4: UILabel!
    @IBOutlet weak var arrow3_5: UILabel!
    @IBOutlet weak var arrow3_6: UILabel!
    @IBOutlet weak var partialResult3_2: UILabel!
    @IBOutlet weak var roundResult3: UILabel!
    @IBOutlet weak var uebertrag3: UILabel!
    
    @IBOutlet weak var arrow4_1: UILabel!
    @IBOutlet weak var arrow4_2: UILabel!
    @IBOutlet weak var arrow4_3: UILabel!
    @IBOutlet weak var partialResult4_1: UILabel!
    @IBOutlet weak var arrow4_4: UILabel!
    @IBOutlet weak var arrow4_5: UILabel!
    @IBOutlet weak var arrow4_6: UILabel!
    @IBOutlet weak var partialResult4_2: UILabel!
    @IBOutlet weak var roundResult4: UILabel!
    @IBOutlet weak var uebertrag4: UILabel!
    
    @IBOutlet weak var arrow5_1: UILabel!
    @IBOutlet weak var arrow5_2: UILabel!
    @IBOutlet weak var arrow5_3: UILabel!
    @IBOutlet weak var partialResult5_1: UILabel!
    @IBOutlet weak var arrow5_4: UILabel!
    @IBOutlet weak var arrow5_5: UILabel!
    @IBOutlet weak var arrow5_6: UILabel!
    @IBOutlet weak var partialResult5_2: UILabel!
    @IBOutlet weak var roundResult5: UILabel!
    @IBOutlet weak var uebertrag5: UILabel!
    
    @IBOutlet weak var arrow6_1: UILabel!
    @IBOutlet weak var arrow6_2: UILabel!
    @IBOutlet weak var arrow6_3: UILabel!
    @IBOutlet weak var partialResult6_1: UILabel!
    @IBOutlet weak var arrow6_4: UILabel!
    @IBOutlet weak var arrow6_5: UILabel!
    @IBOutlet weak var arrow6_6: UILabel!
    @IBOutlet weak var partialResult6_2: UILabel!
    @IBOutlet weak var roundResult6: UILabel!
    @IBOutlet weak var uebertrag6: UILabel!
    
    @IBOutlet weak var gesamtergebnis: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = result {
            roundResult1.text = String(result.round1_result)
            roundResult2.text = String(result.round2_result)
            roundResult3.text = String(result.round3_result)
            roundResult4.text = String(result.round4_result)
            roundResult5.text = String(result.round5_result)
            roundResult6.text = String(result.round6_result)
            
            uebertrag1.text = String(uebertrag(round: 1))
            uebertrag2.text = String(uebertrag(round: 2))
            uebertrag3.text = String(uebertrag(round: 3))
            uebertrag4.text = String(uebertrag(round: 4))
            uebertrag5.text = String(uebertrag(round: 5))
            uebertrag6.text = String(uebertrag(round: 6))
            
            gesamtergebnis.text = String(uebertrag(round: 6))
        }
    }
    
    func uebertrag(round: Int) -> Int {
        var uebertraege: [Int] = []
        uebertraege.append(result!.round1_result)
        uebertraege.append(uebertraege[0] + result!.round2_result)
        uebertraege.append(uebertraege[1] + result!.round3_result)
        uebertraege.append(uebertraege[2] + result!.round4_result)
        uebertraege.append(uebertraege[3] + result!.round5_result)
        uebertraege.append(uebertraege[4] + result!.round6_result)
        
        return uebertraege[round - 1]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
