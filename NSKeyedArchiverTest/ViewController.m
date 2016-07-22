//
//  ViewController.m
//  NSKeyedArchiverTest
//
//  Created by zhangzhihua on 16/6/12.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"

#define PERSONAL_FILE_PATHNAME [NSHomeDirectory() stringByAppendingString:@"/personalcache.plist"]

@interface ViewController (){
    
    UITextField *_textFiled;
    
    UIButton *_saveButton;
    
    UIButton *_readButton;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _textFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, 280, 20)];
    _textFiled.borderStyle = UITextBorderStyleBezel;
    _textFiled.textColor = [UIColor grayColor];
    [self.view addSubview:_textFiled];
    
    _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _saveButton.frame = CGRectMake(20, 100, 40, 20);
    [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [_saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [_saveButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_saveButton];
    
    _readButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _readButton.frame = CGRectMake(20, 160, 40, 20);
    [_readButton setTitle:@"读取" forState:UIControlStateNormal];
    [_readButton addTarget:self action:@selector(read) forControlEvents:UIControlEventTouchUpInside];
    [_readButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_readButton];
    
    
}





-(void)save{
    NSLog(@"save");
    [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"%@",PERSONAL_FILE_PATHNAME]];
    NSData*data=[NSKeyedArchiver archivedDataWithRootObject:_textFiled.text];
    NSLog(@"NSData --- %@",data);
    BOOL orSave = [[NSFileManager defaultManager]createFileAtPath:PERSONAL_FILE_PATHNAME contents:data attributes:nil];
    
    NSLog(@"save --- %d",orSave);
}

-(void)read{
    
    if([[NSFileManager defaultManager]fileExistsAtPath:PERSONAL_FILE_PATHNAME isDirectory:nil]){
        NSLog(@"read");
        NSData *data= [NSData dataWithContentsOfFile:PERSONAL_FILE_PATHNAME];
        NSString * obj=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSLog(@"obj .... %@",obj);
        _textFiled.text = obj;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
