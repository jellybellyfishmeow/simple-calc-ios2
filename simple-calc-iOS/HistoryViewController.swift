//
//  HistoryViewController.swift
//  simple-calc-iOS
//
//  Created by iGuest on 11/4/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    var history = [String]()
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in history {
            let label = UILabel(frame: CGRect(x: 0, y: history.index(of: item)! * 30+200, width: 500, height: 40))
            label.text = item
            self.scrollView.addSubview(label)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calcView = segue.destination as! ViewController
        calcView.history = history
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
