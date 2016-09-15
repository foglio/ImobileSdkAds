//
//  NativeInfeedViewController.m
//  imobilesample
//
//  Created by i-mobile on 2015/10/19.
//  Copyright © 2015年 i-mobile. All rights reserved.
//

#import "NativeInfeedViewController.h"

@interface ListMediaListData : NSObject
// リストのタイトル
@property (nonatomic) NSString *listTitle;

// リストのディスクリプション
@property (nonatomic) NSString *listDescription;

// リストの画像
@property (nonatomic) UIImage *listImage;
@end
@implementation ListMediaListData
@end

@interface NativeInfeedViewController ()
// セルの追加数
@property (nonatomic) int callCount;
// リストデータ
@property (nonatomic) NSMutableArray *cellDataList;

@property (nonatomic) ImobileSdkAdsTableController *imobileSdkAdsTableController;


@end

@implementation NativeInfeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *pid = self.adDisplayInfo.pid;
    NSString *mid = self.adDisplayInfo.mid;
    NSString *sid = self.adDisplayInfo.sid;
    
    // Resourceの初期化
    self.callCount = 0;
    self.cellDataList = [NSMutableArray array];
    [self addData];
    // UIの更新
    self.adTableView.delegate = self;
    self.adTableView.dataSource = self;
    
    // スポット情報を設定します
    [ImobileSdkAds registerWithPublisherID:pid MediaID:mid SpotID:sid];
    
    // デリゲートの登録をします
    [ImobileSdkAds setSpotDelegate:sid delegate:self];
    
    // 広告の取得を開始します
    [ImobileSdkAds startBySpotID:sid];
    
    // 広告を表示します
    self.imobileSdkAdsTableController = [ImobileSdkAds getTableController:sid TableView:self.adTableView Nib:[UINib nibWithNibName:@"AdCellLayout" bundle:nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#pragma mark セクション数の返却
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark データ数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellDataList count];
}

#pragma mark cellの描画
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListMediaListData *cellData = (ListMediaListData *) [self.cellDataList objectAtIndex:indexPath.row];
    
    NSString *cellkey = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellkey];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellkey];
    }
    
    // 画像のセット
    cell.imageView.image = cellData.listImage;
    
    // タイトルのセット
    cell.textLabel.text = cellData.listTitle;
    
    // ディスクリプションのセット
    cell.detailTextLabel.text = cellData.listDescription;
    
    return cell;
}

#pragma mark tableViewが一番下に表示までスクロールした時に呼ばれます（サンプルではセルの追加を行っています）
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(self.adTableView.contentOffset.y >= (self.adTableView.contentSize.height - self.adTableView.bounds.size.height)){
        [self addData];
        [self.adTableView reloadData];
    }
}

#pragma mark - セルの追加
- (void)addData{
    for(int i = self.callCount * 20;i < (self.callCount + 1) * 20;i++){
        ListMediaListData *cellData = [[ListMediaListData alloc] init];
        cellData.listTitle = [NSString stringWithFormat:@"title : %d",i];
        cellData.listDescription = [NSString stringWithFormat:@"description : %d",i];
        cellData.listImage = [UIImage imageNamed:@"sampleicon.png"];
        [self.cellDataList addObject:cellData];
    }
    self.callCount++;
}

// 広告の表示が完了した際に呼ばれます
- (void)imobileSdkAdsSpotDidShow:(NSString *)spotid{
    NSLog(@"広告の表示が完了した際に呼ばれます %@",spotid);
}

// 広告をクリックした際に呼ばれます
- (void)imobileSdkAdsSpotDidClick:(NSString *)spotid{
    NSLog(@"広告をクリックした際に呼ばれます %@",spotid);
}

@end