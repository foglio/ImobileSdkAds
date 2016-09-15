//
//  AppDelegate.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/03/06.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 機種の取得
        var storyboard : UIStoryboard
        var modelname : String!
        var boardname : String!
        modelname = UIDevice.currentDevice().model
        
        // iPadかどうか判断する
        if(!modelname.hasPrefix("iPad")){
            boardname = "iPhone"
        }else{
            boardname = "iPad"
        }
        
        // StoryBoardのインスタンス化
        storyboard = UIStoryboard.init(name: boardname,bundle: NSBundle.mainBundle())
        
        // 画面の生成
        let mainViewController : UIViewController = storyboard.instantiateInitialViewController()!
        
        // ルートウィンドウにひっつける
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication){
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}