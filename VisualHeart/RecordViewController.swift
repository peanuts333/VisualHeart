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
    
   //選択ボタンに枠をつける
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
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "MM月dd日"
        
        let recordText = recordTextField.text
        var colorNumberStr = ""
        if let number = colorNumber {
            colorNumberStr = String(number)
        }
        
        if recordText != "" || colorNumber != nil {
            var recordArray = ud.array(forKey: "ARRAY") as? [[String]] ?? []
            // 記録されてる配列を取得 [["あいうえお", "1"]]
            var record = [recordText ?? "", colorNumberStr]
            record.append(contentsOf: [df.string(from: date)])
            recordArray.append(record) // 記録されてる配列に今回の記録を追加 [["あいうえお", "1"], ["かきくけこ", "2"]]
            ud.set(recordArray, forKey: "ARRAY")
            print(recordArray.count)
            
        }
    }
    
//    func removeUserDefaults() {
//        let appDomain = Bundle.main.bundleIdentifier
//        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
//    }

    override func viewDidLoad() {
        
        //removeUserDefaults()
        
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
        recordTextField.text = ""
        blackButton.layer.borderWidth = 0
        whiteButton.layer.borderWidth = 0
        blueButton.layer.borderWidth = 0
        redButton.layer.borderWidth = 0
        
        //アラートの作成
        if recordTextField.text == "" && colorNumber == nil{
            let alert = UIAlertController(
                title:"エラー",
                message:"記録がありません。",
                preferredStyle: .alert
              
            )
            //アラートを表示する。
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        } else {
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
        }
        
//        //アラートを表示する。
//        alert.addAction(UIAlertAction(
//            title: "OK",
//            style: .default,
//            handler: nil
//        ))
//        present(alert, animated: true, completion: nil)
        
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
