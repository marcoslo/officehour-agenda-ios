//
//  ListarPessoasViewController.m
//  Hello World
//
//  Created by Maurílio Campos on 3/4/13.
//  Copyright (c) 2013 Kiwi Tecnologia. All rights reserved.
//

#import "ListarPessoasViewController.h"

@implementation ListarPessoasViewController

-(void) viewDidLoad
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *idt = @"pessoa_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idt];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idt];
        NSLog(@"Criou uma celula");
    } else {
        NSLog(@"Reaproveitou uma celula existente. que legal, programação sustentavel!");
    }
    
    [cell.textLabel setText:@"Item"];
    return cell;
}

@end
