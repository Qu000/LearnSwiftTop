//
//  DetailTableViewController.swift
//  FansArea
//
//  Created by qujiahong on 2018/6/2.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var RatingBtn: UIButton!
    @IBOutlet weak var largeImageView: UIImageView!
    var area : Area!
    
    
    // MARK: - System
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "详情页面"
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
        
        largeImageView.image = UIImage(named: area.thumbImage)
   
    }
    // MARK: - 模态视图--评分
    @IBAction func clickToReview(_ sender: UIButton) {
        let reviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
        
        reviewVC.ratingCloser = { (value:String) -> Void in
                self.RatingBtn.setImage(UIImage(named: value), for: .normal)
                
        }
        
        reviewVC.imageStr = area.thumbImage
        self.present(reviewVC, animated: true, completion: nil)
        
    }
    
    // MARK: - push--地图
    @IBAction func clickToMap(_ sender: UIButton) {
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapVC.area = area
        self.navigationController?.pushViewController(mapVC, animated: true)
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell

        switch indexPath.row {
        case 0:
            cell.filedLab.text = "地区"
            cell.valueLab.text = "\n"+area.name+"\n"
            
        case 1:
            cell.filedLab.text = "省"
            cell.valueLab.text = "\n"+area.province+"\n"
            
        case 2:
            cell.filedLab.text = "地名"
            cell.valueLab.text = "\n"+area.part+"\n"
            
        case 3:
            cell.filedLab.text = "去过吗"
            cell.valueLab.text = area.visited ? "\n"+"去过"+"\n" : "\n"+"没去过"+"\n"
         
        default:
            break
        }

        cell.backgroundColor = UIColor.clear
        return cell
    }
 
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
