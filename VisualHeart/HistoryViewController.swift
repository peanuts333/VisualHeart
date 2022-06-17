//
//  ViewController.swift
//  VisualHeart
//
//  Created by user on 2022/05/22.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var HistoryTableView: UITableView!
    @IBOutlet var allDeleteButton: UIButton!
    
    let ud = UserDefaults.standard
    
    var recordArray:[[String]] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        HistoryTableView.rowHeight = 70
        //tableView.rowHeight = UITableView.automaticDimension
       // HistoryTableView.register(HistoryTableViewCell.self)
        
//tableView
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getRecord()
    }
    
    func getRecord() {
        recordArray = ud.array(forKey: "ARRAY") as? [[String]] ?? []
        recordArray.reverse()
        HistoryTableView.reloadData() // TableViewのリロード
    }
    
    // MARK: - Table view data source
    
    //セクション数の指定
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //セルの個数指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recordArray.count
    }
    
    //セルの中身表示の仕方
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        as! HistoryTableViewCell
        
        // [["あいうえお", "1"], ["かきくけこ", "2"], ["さしすせそ", "1"]]
        
        let record = recordArray[indexPath.row]
        
        let text = record[0] // あいうえお
        let color = record[1] // "1"
        let date = record[2]
        cell.historyTextLabel.text = text
        cell.historyDateLabel.text = date
        //cell.historyDateLabel.text = record[2]
         
        // 🔍Switch文 if文の上位互換
        switch color {
        case "0":
            cell.historyColorImageView.backgroundColor = UIColor(red: 0.85, green: 0.40, blue: 0.37, alpha: 1) // alphaは、透明度
        case "1":
            cell.historyColorImageView.backgroundColor = UIColor(red: 0.415, green: 0.588, blue: 0.964, alpha: 1) // alphaは、透明度
        case "2":
            cell.historyColorImageView.backgroundColor = UIColor(red: 0.349, green: 0.349, blue: 0.349, alpha: 1) // alphaは、透明度
        case "3":
            cell.historyColorImageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) // alphaは、透明度
            cell.historyColorImageView.layer.borderWidth = 0.5
        default:
            break
        }
        cell.textLabel?.numberOfLines = 0
        return cell
        // Configure the cell...
        
  
    }
    //スワイプした行のみ削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recordArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        UserDefaults.standard.set(recordArray, forKey: "ARRAY" )

    }
    //全削除
//    func deleteAllTableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            recordArray.removeAll()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//
//        UserDefaults.standard.set(recordArray, forKey: "ARRAY" )
//
//    }
    
    @IBAction func deleteAll(){
        if recordArray == []{
            let emptyAlert = UIAlertController(
                title:"エラー",
                message:"履歴がありません。",
                preferredStyle: .alert
              
            )
            let emptyOk = UIAlertAction(title: "OK", style: .cancel) { (acrion) in
                self.dismiss(animated: true, completion: nil)
            }
            emptyAlert.addAction(emptyOk)
            present(emptyAlert, animated: true, completion: nil)
        } else {
        let alert = UIAlertController(
            title:"確認",
            message:"履歴をすべて削除します。本当によろしいですか。",
            preferredStyle: .alert
          
        )
        let ok = UIAlertAction(title: "すべて削除", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
//            deleteAllTableView(_ tableView: UITableView, commit:editingStyle,: UITableViewCell.EditingStyle, forRowAt: IndexPath)
            
        }
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { (acrion) in
            self.dismiss(animated: true, completion: nil)
        }
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        print(recordArray)
    }
    //*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

   
