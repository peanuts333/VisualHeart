//
//  RecordViewController.swift
//  VisualHeart
//
//  Created by user on 2022/05/25.
//

import UIKit

class RecordViewController: UIViewController {
    
    var alertController: UIAlertController!
    var colorNumber: Int?
    
    @IBOutlet var recordTextField: UITextField!
   
    let ud = UserDefaults.standard
   
    
    @IBAction func redButton(){
        colorNumber = 0
    }
    @IBAction func blueButton(){
        colorNumber = 1
    }
    @IBAction func blackButton(){
        colorNumber = 2
    }
    @IBAction func whiteButton(){
        colorNumber = 3
    }
    
    func saveRecord() {
        let recordText = recordTextField.text
        var colorNumberStr = ""
        if let number = colorNumber {
            colorNumberStr = String(number)
        }
        
        if recordText != "" || colorNumber != nil {
            var recordArray = ud.array(forKey: "ARRAY") as? [[String]] ?? [] // 記録されてる配列を取得 [["あいうえお", "1"]]
            let record = [recordText ?? "", colorNumberStr]
            recordArray.append(record) // 記録されてる配列に今回の記録を追加 [["あいうえお", "1"], ["かきくけこ", "2"]]
            ud.set(recordArray, forKey: "ARRAY")
        }
    }

  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //アラートを表示するメソッド
    func alert(title:String, message:String) {
            alertController = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil))
            present(alertController, animated: true)
        }
    
  
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishButton(){
    
        //アラートの作成
        let alert = UIAlertController(
            title:"記録完了",
            message:"記録が完了しました。",
            preferredStyle: .alert
        )
   //アラートを表示する。
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
            }
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

//}
