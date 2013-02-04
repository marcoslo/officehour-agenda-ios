//
//  ViewController.h
//  Hello World
//
//  Created by Maurílio Campos on 12/29/12.
//  Copyright (c) 2012 Kiwi Tecnologia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
}


-(IBAction)toqueBotao:(id)sender;

@property (nonatomic, strong) IBOutlet UILabel *resposta;
@property (nonatomic, strong) IBOutlet UITextField *campoNome;

@end
