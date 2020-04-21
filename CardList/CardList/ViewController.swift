//
//  ViewController.swift
//  CardList
//
//  Created by PCQ184 on 21/04/20.
//  Copyright © 2020 PCQ184. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var additemButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var data:[CardList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapOnPlusButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardListTableViewCell") as! CardListTableViewCell
        cell.titleLabel.text = data[indexPath.row].title
        cell.descriptionLabel.text = data[indexPath.row].description
        cell.priceLabel.text = data[indexPath.row].price
        cell.listImage.image = data[indexPath.row].productimage
        return cell
    }
    
    
}
extension ViewController: senditem {
    func item(producttitle:String,productprice:String,productimage:UIImage,productdescription:String) {
        data.append(CardList(title: producttitle, description: productdescription, price: productprice, productimage: productimage))
        DispatchQueue.main.async {
            self.tableView.reloadData()
               }

           }
}

