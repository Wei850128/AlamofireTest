//
//  DetailViewController.swift
//  AlamofireTest
//
//  Created by 劉家瑋 on 2020/8/10.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var data: Ubike?
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = data?.sna
        addressLabel.text = data?.ar
        // Do any additional setup after loading the view.
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
