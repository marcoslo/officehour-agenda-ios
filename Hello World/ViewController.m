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
#import "Persistencia.h"

@implementation ViewController

- (void)viewDidLoad
{
    
    /* ARRAYS */
    
    NSArray *pessoas = [[NSArray alloc] initWithObjects:@"Maurilio", @"Chuck Norris", nil];
    pessoas = @[@"Maurilio", @"Chuck Norris", @20];
    NSLog(@"Array indice 1: %@", [pessoas objectAtIndex:1]);
    
    NSMutableArray *pessoas_mutaveis = [[NSMutableArray alloc] init];
    [pessoas_mutaveis addObject:@"Maurilio"];
    [pessoas_mutaveis addObject:@"Silvio Santos"];
    [pessoas_mutaveis addObject:@"Dercy Goncalves"];
    [pessoas_mutaveis removeObjectAtIndex:1];
    NSLog(@"Array indice 1: %@", [pessoas_mutaveis objectAtIndex:1]);
    
    
    
    /* NSDictionary */
    NSMutableArray *pessoas_dicionario = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *pessoa = [[NSMutableDictionary alloc] init];
    [pessoa setValue:@"Maurilio" forKey:@"nome"];
    [pessoa setValue:@"mauriliohrc@gmail.com" forKey:@"email"];
    [pessoas_dicionario addObject:pessoa];
    
    NSMutableDictionary *pessoa2 = [[NSMutableDictionary alloc] init];
    [pessoa2 setValue:@"Silvio Santos" forKey:@"nome"];
    [pessoa2 setValue:@"silvio@sbt.com.br" forKey:@"email"];
    [pessoas_dicionario addObject:pessoa2];

    
    NSLog(@"--------------------------------------");
    
    for (NSMutableDictionary *item in pessoas_dicionario) {
        NSLog(@"Nome: %@", [item objectForKey:@"nome"]);
        NSLog(@"Email: %@", [item objectForKey:@"email"]);
    }
    
    NSLog(@"--------------------------------------");
    
    [super viewDidLoad];
	Pessoa *eu = [[Pessoa alloc] init];
    [eu setNome:@"Maurilio Henrique" email:@"mauriliohrc@gmail.com"];
    NSLog(@"Apresentação: %@", [eu meApresentar]);
    
    Funcionario *funcionario = [[Funcionario alloc] initWithPessoa:eu departamento:@"T.I" salario:1.0f cargo:@"Chapa"];
    NSLog(@"Apresentação Funcionário: %@", [funcionario meApresentar]);
    
    //Testando protocolos
    if ([eu conformsToProtocol:@protocol(Persistencia)]) {
        [eu salvar];
        [eu excluir];
        
        if ([eu respondsToSelector:@selector(dizerOla)]) {
            [eu dizerOla];
        } else {
            NSLog(@"Este objeto não implementa o metodo dizerOla");
        }
    } else {
        NSLog(@"Este objeto não implementa o protocol Persistencia");
    }
    
    
    if ([funcionario conformsToProtocol:@protocol(Persistencia)]) {
        [funcionario salvar];
        [funcionario excluir];
        
        if ([funcionario respondsToSelector:@selector(dizerOla)]) {
            [funcionario dizerOla];
        } else {
            NSLog(@"Este objeto não implementa o metodo dizerOla");
        }
    } else {
        NSLog(@"Este objeto não implementa o protocol Persistencia");
    }
    
}
@end
