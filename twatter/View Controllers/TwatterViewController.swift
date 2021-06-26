//
//  TwatterViewController.swift
//  twatter
//
//  Created by Abba on 25/06/2021.
//

import UIKit

class TwatterViewController: UIViewController {

    @IBOutlet weak var logOutButton: UIButton!
    let userUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(userUID!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logOutTapped(_ sender: Any) {
    }
    
    @IBAction func postTapped(_ sender: Any) {
    }
    
    @IBAction func attachTapped(_ sender: Any) {
    }
}
