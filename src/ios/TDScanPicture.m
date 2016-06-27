//
//  TDScanPicture.m
//  TDScanPicture
//
//  Created by 路亮亮 on 16/2/18.
//
//

#import "TDScanPicture.h"

@interface TDScanPicture ()

@end

@implementation TDScanPicture

- (void)tdScanPicture:(CDVInvokedUrlCommand*)command{
    NSArray *paramArr = command.arguments;
    NSString *jsonStr = [paramArr objectAtIndex:0];
    NSDictionary *dataDic = [self dictionaryWithJsonString:jsonStr];
    NSInteger currentIndex = [[dataDic objectForKey:@"index"] integerValue];
    MLSelectPhotoBrowserViewController *browserVc = [[MLSelectPhotoBrowserViewController alloc] init];
    [browserVc setValue:@(NO) forKeyPath:@"isTrashing"];
    browserVc.isModelData = NO;
    browserVc.currentPage = currentIndex;
    browserVc.photos = [dataDic objectForKey:@"data"];
    browserVc.deleteCallBack = ^(NSArray *assets){
    };
    TDNavgationController *nav = [[TDNavgationController alloc] initWithRootViewController:browserVc];
    nav.navigationBar.translucent = NO;
    nav.navigationBar.barTintColor = RGB(0x3691e6);
    nav.navigationBar.tintColor = [UIColor whiteColor];
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:18.f], NSFontAttributeName, nil]];
    [self.viewController presentViewController:nav animated:YES completion:^{
    }];
}

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
