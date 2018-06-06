//
//  Area.swift
//  FansArea
//
//  Created by qujiahong on 2018/6/2.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

struct Area {
    ///name
    var name : String
    ///省份
    var province : String
    ///地区
    var part : String
    ///缩略图
    var thumbImage : String
    ///记录状态
    var visited : Bool
    
    ///新增评分字段
    var rating = ""
    
    
    init(name: String, province: String, part: String, thumbImage: String, visited: Bool) {
        self.name = name
        self.province = province
        self.part = part
        self.thumbImage = thumbImage
        self.visited = visited
    }
}


