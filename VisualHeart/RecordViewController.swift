//
//  RecordViewController.swift
//  VisualHeart
//
//  Created by user on 2022/05/25.
//

import UIKit

class RecordViewController: UIViewController {
    
    var alertController: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
        alert(title:"記録完了", message:"記録が完了しました。")
        //self.dismiss(animated: true, completion: nil)
        //self.performSegue(withIdentifier: "MainViewController", sender: nil)
    }
    
    @IBAction func redButton(){
        
    }
    @IBAction func blueButton(){
        
    }
    @IBAction func blackButton(){
        
    }
    @IBAction func whiteButton(){
        
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
