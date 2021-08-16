//
//  SecondViewController.swift
//  Data Passing Using Storyboard
//
//  Created by Sharetrip-iOS on 11/08/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var addressLbl : UILabel!
    @IBOutlet weak var personImg : UIImageView!
    
    
    static let identifier = "SecondViewController"
    
    
    
    var name : String!
    var address : String!
    var img : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLbl.text = name
        self.addressLbl.text = address
        self.personImg.image = img
        
       
    }
    

}
