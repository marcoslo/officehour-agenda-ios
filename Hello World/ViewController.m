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
#import "Persistence.h"

@implementation ViewController

@synthesize campoNome = _campoNome;
@synthesize campoEmail = _campoEmail;
@synthesize campoTelefone = _campoTelefone;

-(IBAction)toqueBotao:(id)sender
{
    
    NSString *nome = _campoNome.text;
    NSString *email = _campoEmail.text;
    NSNumber *fone = [NSNumber numberWithInteger:[_campoTelefone.text integerValue]];
    
    Pessoa *pessoa = [[Pessoa alloc] init];
    [pessoa setNome:nome];
    [pessoa setEmail:email];
    [pessoa setTelefone:fone];

    Persistence *persistencia = [[Persistence alloc] init];
    NSDictionary *dados = @{
      @"tabela" : @"pessoa",
      @"campos" :
          @[
              @{ @"campo": @"nome", @"valor" : pessoa.nome },
              @{ @"campo": @"email", @"valor" : pessoa.email },
              @{ @"campo": @"telefone", @"valor" : pessoa.telefone }
              ]
      };
    
    if ([persistencia incluir:dados]) {
        
        [_campoTelefone setText:@""];
        [_campoEmail setText:@""];
        [_campoNome setText:@""];
        
    } else {
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Falha ao incluir pessoa." delegate:nil cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
        [alerta show];
        
    }
}

- (void)viewDidLoad
{
    
    /*
    Persistence *persistence = [[Persistence alloc] init];
    NSDictionary *pessoa = @{
                                @"tabela" : @"pessoa",
                                @"campos" : @[
                                                @{@"campo" : @"nome", @"valor" : @"Maurilio"} ,
                                                @{@"campo" : @"email", @"valor" : @"mauriliohrc@gmail.com" },
                                                @{@"campo" : @"telefone", @"valor" : @20 }
                                             ]
                            };
    
    [persistence incluir:pessoa];
    [persistence incluir:pessoa];
    [persistence incluir:pessoa];
    
    NSDictionary *dados = @{@"tabela":@"pessoa", @"valor":@2};
    
    [persistence excluir:dados];
    
    NSDictionary *funcionario = @{
        @"tabela" : @"funcionario",
        @"campos" : @[
                     @{@"campo" : @"cargo", @"valor" : @"chapa" },
                     @{@"campo" : @"pessoa_id", @"valor" : @1}
            ]
    };
    [persistence incluir:funcionario];
    */
    
    /* properties */
    
    Pessoa *pessoaP = [[Pessoa alloc] init];
    
    [pessoaP setEmail:@"joao@joao.com"];
    [pessoaP setTelefone:@20];
    [pessoaP setNome:@"João"];
    
    NSLog(@"Property, pessoa nome: %@", pessoaP.nome);
    
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
