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
    @IBOutlet var deleteButton: UIButton!
    
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
        
        blueButton.layer.borderWidth = 0
        blackButton.layer.borderWidth = 0
        whiteButton.layer.borderWidth = 0
    }
    
    @IBAction func blueButtonTapped(){
        colorNumber = 1
        blueButton.layer.borderWidth = 5.0
        blueButton.layer.borderColor = UIColor.black.cgColor
        
        redButton.layer.borderWidth = 0
        blackButton.layer.borderWidth = 0
        whiteButton.layer.borderWidth = 0
    }
    
    @IBAction func blackButtonTapped(){
        colorNumber = 2
        blackButton.layer.borderWidth = 5.0
        blackButton.layer.borderColor = UIColor.black.cgColor
        
        blueButton.layer.borderWidth = 0
        redButton.layer.borderWidth = 0
        whiteButton.layer.borderWidth = 0
    }
    @IBAction func whiteButtonTapped(){
        colorNumber = 3
        whiteButton.layer.borderWidth = 5.0
        whiteButton.layer.borderColor = UIColor.black.cgColor
        
        blueButton.layer.borderWidth = 0
        blackButton.layer.borderWidth = 0
        redButton.layer.borderWidth = 0
       
    }
    
    @IBAction func deleteButtonTapped(){
        recordTextField.text = ""
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
        
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: recordTextField.frame.size.height - width, width:  recordTextField.frame.size.width, height: 1)
        border.borderWidth = width
        
        recordTextField.layer.addSublayer(border)
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
    
  
    @IBAction func backButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishButtonTapped(){
        
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
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.dismiss(animated: true, completion: nil)
            //self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
  //  }
    
  
    
   
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
