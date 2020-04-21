//
//  SecondViewController.swift
//  CardList
//
//  Created by PCQ184 on 21/04/20.
//  Copyright © 2020 PCQ184. All rights reserved.
//

import UIKit
protocol senditem {
    func item(producttitle:String,productprice:String,productimage:UIImage,productdescription:String)
}

class SecondViewController: UIViewController {
    var delegate:senditem?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextField: UITextField!
    @IBOutlet weak var productPriceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage.contentMode = .scaleAspectFit
        productImage.layer.cornerRadius = (productImage.frame.size.width)/2
    
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnSelectImage(_ sender: Any) {
        let imagepicker = UIImagePickerController()
               imagepicker.delegate = self
               imagepicker.sourceType = .photoLibrary
               self.present(imagepicker, animated: true, completion: nil)
    }
    
    
       
    
    func alert(message:String) {
        let alert = UIAlertController(title: "Some error Occcured", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapOnAddToCart(_ sender: UIButton) {
        if(productTitleTextField.text?.count == 0 || productTitleTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true) {
            self.alert(message: "Please Enter ProductList Field")
        }
        else if(productDescriptionTextField.text?.count == 0 || productDescriptionTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true) {
            self.alert(message: "Please Enter ProductDescription Field")
        }
        else if(productPriceTextField.text?.count == 0 || productPriceTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true){
            self.alert(message: "Please enter Product Price")
        }
        else {
            delegate?.item(producttitle: productTitleTextField.text ?? "", productprice: productPriceTextField.text ?? "", productimage: productImage.image ?? UIImage(), productdescription: productDescriptionTextField.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }
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
extension SecondViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            productImage.contentMode = .scaleAspectFit
            productImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}
