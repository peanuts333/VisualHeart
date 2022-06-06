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
    @IBOutlet var redButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var blackButton: UIButton!
    @IBOutlet var whiteButton: UIButton!
    
   //選択ボタンを丸くする設定
    func buttonLayout(){
        redButton.layer.cornerRadius = 30
        blueButton.layer.cornerRadius = 30
        blackButton.layer.cornerRadius = 30
        whiteButton.layer.cornerRadius = 30
    }
    
    let ud = UserDefaults.standard

   
    @IBAction func redButtonTapped(){
        colorNumber = 0
        redButton.layer.borderWidth = 5.0
        redButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func blueButtonTapped(){
        colorNumber = 1
        blueButton.layer.borderWidth = 5.0
        blueButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func blackButtonTapped(){
        colorNumber = 2
        blackButton.layer.borderWidth = 5.0
        blackButton.layer.borderColor = UIColor.black.cgColor
    }
    @IBAction func whiteButtonTapped(){
        colorNumber = 3
        whiteButton.layer.borderWidth = 5.0
        whiteButton.layer.borderColor = UIColor.black.cgColor
       
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
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String {
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: now as Date)
        }

  

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLayout()
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
        
        saveRecord()
    
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
