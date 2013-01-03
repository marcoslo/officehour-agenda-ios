//
//  ViewController.m
//  Hello World
//
//  Created by Maurílio Campos on 12/29/12.
//  Copyright (c) 2012 Kiwi Tecnologia. All rights reserved.
//

#import "ViewController.h"
#import "Pessoa.h"
#import "Funcionario.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	Pessoa *eu = [[Pessoa alloc] init];
    [eu setNome:@"Maurilio Henrique" email:@"mauriliohrc@gmail.com"];
    NSLog(@"Apresentação: %@", [eu meApresentar]);
    
    Funcionario *funcionario = [[Funcionario alloc] initWithPessoa:eu departamento:@"T.I" salario:1.0f cargo:@"Chapa"];
    NSLog(@"Apresentação Funcionário: %@", [funcionario meApresentar]);
}
@end
