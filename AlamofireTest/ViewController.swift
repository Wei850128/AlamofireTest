//
//  ViewController.swift
//  AlamofireTest
//
//  Created by 劉家瑋 on 2020/8/10.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var ubike: [Ubike]?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        HttpBike.shared.request(url: "https://data.ntpc.gov.tw/api/datasets/71CD1490-A2DF-4198-BEF1-318479775E8A/json/preview", method: .get, parameters: nil, type: [Ubike].self, success: { (result) in
            if result is [Ubike] {
                self.ubike = result as? [Ubike]
                self.tableview.reloadData()
            }
        }) {
            print("error")
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ubike?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UbikeCell") as! UbikeTableViewCell
        cell.name.text = ubike?[indexPath.row].sna ?? ""
        cell.address.text = ubike?[indexPath.row].ar ?? ""
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dvc = segue.destination as? DetailViewController {
                if let selectedRow = tableview.indexPathForSelectedRow {
                    dvc.data = ubike?[selectedRow.row]
            }
        }
    }
}



