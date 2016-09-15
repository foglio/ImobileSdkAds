//
//  NativeInfeedViewController.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/11/26.
//  Copyright © 2016年 i-mobile. All rights reserved.
//
import UIKit

class MediaListData: NSObject {
    // タイトル
    var listTitle: String
    // ディスクリプション
    var listDescription: String
    // 画像
    var listImage: UIImage
    
    // 初期化
    override init() {
        self.listTitle = ""
        self.listDescription = ""
        self.listImage = UIImage.init()
    }
}

class NativeInfeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var adDisplayInfo : AdDisplayInfo!
    
    @IBOutlet weak var adTableView: UITableView!
    
    var imobileSdkAdsTableController : ImobileSdkAdsTableController!
    var cellDataList : NSMutableArray = []
    var callCount : NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pid : String = adDisplayInfo.pid!
        let mid : String = adDisplayInfo.mid!
        let sid : String = adDisplayInfo.sid!
        
        // 初回データの追加
        self.addData()
        
        // Resourceの初期化
        adTableView.delegate = self
        adTableView.dataSource = self
        
        // スポット情報を設定します
        ImobileSdkAds.registerWithPublisherID(pid, mediaID:mid, spotID:sid)
        
        // 広告の取得を開始します
        ImobileSdkAds.startBySpotID(sid)

        // 広告を表示します
        self.imobileSdkAdsTableController = ImobileSdkAds.getTableController(sid, tableView: self.adTableView, nib: UINib(nibName: "AdCellLayout", bundle: nil))
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // データ数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellDataList.count
    }
    
    // cellの描画
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellData = self.cellDataList.objectAtIndex(indexPath.row) as! MediaListData
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.imageView?.image = cellData.listImage
        
        cell.textLabel?.text = cellData.listTitle
        
        cell.detailTextLabel?.text = cellData.listDescription
        
        return cell
    }
    // cellの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    // セルの追加
    func addData(){
        for i in (self.callCount * 20 ..< (self.callCount + 1) * 20){
            let cellData = MediaListData.init()
            cellData.listTitle = NSString(format: "title : %d", i) as String
            cellData.listDescription = NSString(format: "description : %d", i) as String
            cellData.listImage = UIImage(named:"sampleicon.png")!
            self.cellDataList.addObject(cellData)
        }
        self.callCount += 1
    }
    
    // tableViewが一番下に表示までスクロールした時に呼ばれます（サンプルではセルの追加を行っています）
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(self.adTableView.contentOffset.y >= (self.adTableView.contentSize.height - self.adTableView.bounds.size.height)){
            self.addData()
            self.adTableView.reloadData()
        }
    }
}

