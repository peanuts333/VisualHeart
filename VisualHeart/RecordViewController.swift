//
//  RecordViewController.swift
//  VisualHeart
//
//  Created by user on 2022/05/25.
//

import UIKit

class RecordViewController: UIViewController {
    
    var alertController: UIAlertController!
    
    @IBOutlet var recordTextField: UITextField!
    
    let textRecord = UserDefaults.standard
   


    @IBAction func redButton(){
        var colorNumber = 0
    }
    @IBAction func blueButton(){
        var colorNumber = 1
    }
    @IBAction func blackButton(){
        var colorNumber = 2
    }
    @IBAction func whiteButton(){
        var colorNumber = 3
    }
   
    //テキストとして記録した内容を保存するメソッド
    func recordText(){
        textRecord.set(recordTextField.text,forKey: "TEXT")
        textRecord.string(forKey: "TEXT")
        textRecord.synchronize()
        print(recordTextField.text)
    }
    //色として記録した内容を保存するメソッド
    func recordColor(){
        
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
        
       recordText()
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
