//
//  MainViewController.swift
//  VisualHeart
//
//  Created by user on 2022/05/25.
//

import UIKit

class MainViewController: UIViewController, UITabBarDelegate{
    
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var todayWord: UILabel!
    
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String {
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: now as Date)
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = getToday(format: "今日はMM月dd日")

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
