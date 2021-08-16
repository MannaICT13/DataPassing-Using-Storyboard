//
//  ViewController.swift
//  Data Passing Using Storyboard
//
//  Created by Sharetrip-iOS on 11/08/2021.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    
    //MARK:- Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var personImg : UIImageView!
    
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureFunc()
        
    }
    
    
    //MARK:- Handlers
    
    func tapGestureFunc(){
        
        let tap : UITapGestureRecognizer  = UITapGestureRecognizer(target: self, action: #selector(pickingImg))
        personImg.isUserInteractionEnabled = true
        personImg.addGestureRecognizer(tap)
       
        
    }
    
    
    @objc func pickingImg(){
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let tempImg = info[.originalImage] as! UIImage
        personImg.image = tempImg
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func clickBtn(_ sender: Any) {
        
        let secondVC  = self.storyboard?.instantiateViewController(withIdentifier: SecondViewController.identifier) as! SecondViewController
        
        
//        secondVC.nameLbl.text = nameTextField.text
//        secondVC.addressLbl.text = addressTextField.text
        
        guard let name = nameTextField.text else {
            return
        }
        guard  let address = addressTextField.text else {
            return
        }
        guard  let img = personImg.image else {
            return
        }
        
        guard name != "" && address  != "" else {
            return
        }
        
        secondVC.name = name
        secondVC.address = address
        secondVC.img = img
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
        
    }
    
}

