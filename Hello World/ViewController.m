//
//  ViewController.m
//  Hello World
//
//  Created by Maurílio Campos on 12/29/12.
//  Copyright (c) 2012 Kiwi Tecnologia. All rights reserved.
//

#import "ViewController.h"
#import "Pessoa.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	Pessoa *eu = [[Pessoa alloc] init];
    [eu setNome:@"Maurilio Henrique" email:@"mauriliohrc@gmail.com"];
    NSLog(@"Apresentação: %@", [eu meApresentar]);
}
@end
