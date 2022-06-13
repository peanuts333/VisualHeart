//
//  MainViewController.swift
//  VisualHeart
//
//  Created by user on 2022/05/25.
//

import UIKit

class MainViewController: UIViewController, UITabBarDelegate{
    
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var todayWordLabel: UILabel!
    
    //今日の日付
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = getToday(format: "今日はMM月dd日")
        
        let todayWord = ["やらない後悔よりやる後悔",
                         "休息も大切",
                         "笑顔を大切に",
                         "いつもお疲れさま",
                         "毎日生きててえらい",
                         "努力は必ず報われる",
                         "もう一踏ん張り!",
                         "良いことは必ず起こる",
                         "善い行動は必ず自分に返ってくる",
                         "今日がいい日になりますように",]
        
        let r = Int(arc4random()) % todayWord.count
        todayWordLabel.text = String(todayWord[r])
        print(todayWord[r])
        
        //Do any additional setup after loading the view.
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
