//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by qujiahong on 2018/6/2.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {

    var areas = [
        Area(name: "川1", province: "四川", part: "四川省资阳市安岳县", thumbImage: "baiyun", visited: false) ,
        Area(name: "川2", province: "四川", part: "四川省资阳市安岳县", thumbImage: "chengxi", visited: false) ,
        Area(name: "川3", province: "四川", part: "四川省资阳市安岳县", thumbImage: "furong", visited: false) ,
        Area(name: "重1", province: "重庆", part: "重庆巴南万达广场B区", thumbImage: "jinping", visited: false) ,
        Area(name: "重2", province: "重庆", part: "重庆解放碑", thumbImage: "nangang", visited: false) ,
        Area(name: "重3", province: "重庆", part: "重庆洪崖洞", thumbImage: "qilihe", visited: false) ,
        Area(name: "贵1", province: "贵", part: "3贵", thumbImage: "shangjie", visited: false) ,
        Area(name: "贵2", province: "贵", part: "2贵", thumbImage: "wuhou", visited: false) ,
        Area(name: "贵3", province: "贵", part: "贵", thumbImage: "xining", visited: false) ,
        Area(name: "贵4", province: "贵", part: "我不在贵州我不在贵州我不在贵州我不在贵州我不在贵州我不在贵州我不在贵州我不在贵州", thumbImage: "baiyun", visited: false) ,
        Area(name: "贵5", province: "贵", part: "我也不在贵州", thumbImage: "chengxi", visited: false)
    ]
    
   // MARK: - System
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //向下滑动时隐藏导航条
        self.navigationController?.hidesBarsOnSwipe = true
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLab.text = areas[indexPath.row].name
        cell.thumbImage.image = UIImage(named: areas[indexPath.row].thumbImage)
        cell.proviceLab.text = areas[indexPath.row].province
        cell.partLab.text = areas[indexPath.row].part
        
        cell.thumbImage.layer.cornerRadius = cell.thumbImage.frame.size.width/2
        cell.thumbImage.layer.masksToBounds = true
        
//        if visited[indexPath.row] {
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        cell.accessoryType = areas[indexPath.row].visited ? .checkmark : .none
        
        return cell
    }
 
    // MARK: - Table view delegate
    //设置了cell自适应，不能用这个方法，否则自适应无效
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertAC = UIAlertController(title: "友情提示", message: "您点击了\n第\(indexPath.row)行的\n ->\(areas[indexPath.row].part)<-", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "我去过", style: .default) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
            
            //右部扩展
            cell?.accessoryType = .checkmark
            
            self.areas[indexPath.row].visited = true
            
        }
        let action2 = UIAlertAction(title: "不明白", style: .cancel, handler: nil)
        let action3 = UIAlertAction(title: "进入详情页", style: .destructive) { (_) in
            
            let detailTVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailTableViewController") as! DetailTableViewController
            detailTVC.area = self.areas[indexPath.row]
            self.navigationController?.pushViewController(detailTVC, animated: true)
            
        }
        
        alertAC.addAction(action)
        alertAC.addAction(action2)
        alertAC.addAction(action3)
        
        self.present(alertAC, animated: true, completion: nil)
    
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - 有点看不懂的segue的转场
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
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
            areas.remove(at: indexPath.row)
            provinces.remove(at: indexPath.row)
            parts.remove(at: indexPath.row)
            areaImages.remove(at: indexPath.row)
            visited.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 */


    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let alertSheet = UIAlertController(title: "分享到", message: nil, preferredStyle: .actionSheet)
            
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let option3 = UIAlertAction(title: "微博", style: .default, handler: nil)
            let option4 = UIAlertAction(title: "算了吧", style: .cancel, handler: nil)
            
            alertSheet.addAction(option1)
            alertSheet.addAction(option2)
            alertSheet.addAction(option3)
            alertSheet.addAction(option4)
            
            self.present(alertSheet, animated: true, completion: nil)
        }
        let actionDelete = UITableViewRowAction(style: .destructive, title: "删除") { (_, indexPath) in
            self.areas.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let actionTop = UITableViewRowAction(style: .default, title: "我是紫色") { (_, indexPath) in
            //取出当前元素
            
            //删除当前元素
            
            //将当前元素放在数组第0个位置
            
            //刷新table
        }
        
        
        actionShare.backgroundColor = UIColor.orange
        actionTop.backgroundColor = UIColor.purple
        return [actionShare,actionDelete,actionTop]
    }
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

    
    // MARK: - Navigation

    
    /*
     var areas = ["川1","川2","川3","重1","重2","重3","贵1","贵2","贵3","贵4","贵5"]
     
     var areaImages = ["baiyun","chengxi","furong","jinping","nangang","qilihe","shangjie","wuhou","xining","baiyun","chengxi"]
     
     var provinces = ["四川","四川","四川","重庆","重庆","重庆","贵","贵","贵","贵","贵"]
     
     var parts = ["四川一个地方","四川另一个地方","四川的一个地方","重庆的，你莫管嘛","重庆，你莫管嘛","你莫管嘛","3贵","2贵","贵","我不在贵州","我也不在贵州"]
     
     ///cell状态数组，count=cell个数
     var visited = [Bool](repeatElement(false, count: 11))
     
     
     for i in 0..<areas.count {
     print("Area(name: \"\(areas[i])\", province: \"\(provinces[i])\", part: \"\(parts[i])\", thumbImage: \"\(areaImages[i])\", visited: \"\(visited[i])\")",",")
     }
     */

}
