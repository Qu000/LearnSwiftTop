//
//  AddAreaTableViewController.swift
//  FansArea
//
//  Created by qujiahong on 2018/6/6.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

import UIKit

class AddAreaTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var coverImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //检测相册访问权限
        //info.plist里开启Photo、Camera的权限
        if indexPath.row == 0 {
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            
            //实例化一个UIImagePickerController对象
            //属性是：不允许编辑，来源为相册，以模态视图弹出
            let picker = UIImagePickerController()
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            
            //只有实现了代理，才可实现代理的方法
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
      
        switch indexPath.row {
        //检测相册访问权限
        case 0:
            print("图")
        case 1:
            print("地名")
        case 2:
            print("省份")
        case 3:
            print("区县")
        case 4:
            print("是or否")
        default:
            break
        }
    }
    
    //当用户从相册选择一张图后，会触发方法，可从方法的参数中取回图片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //从info字典中，查询"原始图像"
        coverImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //平铺、裁边
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        
        let coverWidthCons = NSLayoutConstraint(item: coverImageView, attribute: .width, relatedBy: .equal, toItem: coverImageView.superview, attribute: .width, multiplier: 1, constant: 0)
        let coverHeightCons = NSLayoutConstraint(item: coverImageView, attribute: .height, relatedBy: .equal, toItem: coverImageView.superview, attribute: .height, multiplier: 1, constant: 0)
        coverWidthCons.isActive = true
        coverHeightCons.isActive = true
        
        
        //视图自退场
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
