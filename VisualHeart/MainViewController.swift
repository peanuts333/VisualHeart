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

    // userdefaultsを用意しておく
    let UD = UserDefaults.standard

    //日付判定関数
    func judgeDate(){
        //現在のカレンダ情報を設定
        let calender = Calendar.current
        //日本時間を設定
        let now_day = Date(timeIntervalSinceNow: 60 * 60 * 9)
        //日付判定結果
        var judge = Bool()

        //日時経過チェック
        if UD.object(forKey: "today") != nil {
            let past_day = UD.object(forKey: "today") as! Date
            let now = calender.component(.day, from: now_day)
            let past = calender.component(.day, from: past_day)
            
            //日にちが変わっていた場合
            if now != past {
                judge = true
            }
            else {
                judge = false
            }
        }
        //初回実行のみelse
        else {
            judge = true
            /* 今の日時を保存 */
            UD.set(now_day, forKey: "today")
        }
        /* 日付が変わった場合はtrueの処理 */
        if judge == true {
            judge = false
            //日付が変わった時の処理をここに書く
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
        }
        else {
            //日付が変わっていない時の処理をここに書く
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = getToday(format: "今日はMM月dd日")
        judgeDate()
        
//        let date = Date()
//
//        let df = DateFormatter()
//
//        df.dateFormat = "yyyy-MM-dd "
//        print(df.string(from: date))
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
