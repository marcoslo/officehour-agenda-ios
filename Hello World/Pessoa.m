//
//  Pessoa.m
//  Hello World
//
//  Created by Maurílio Campos on 12/29/12.
//  Copyright (c) 2012 Kiwi Tecnologia. All rights reserved.
//

#import "Pessoa.h"

@implementation Pessoa

@synthesize nome = _nome;
@synthesize email = _email;
@synthesize telefone = _telefone;


-(BOOL)salvar
{
    NSLog(@"Olá, acabei de salvar esta pessoa");
    return YES;
}

-(BOOL)excluir
{
    NSLog(@"Olá, acabei de excluir esta pessoa");
    return YES;
}

-(void)setNome:(NSString*)nome email:(NSString*)email
{
    _nome = nome;
    _email = email;
}


-(NSString*)meApresentar
{
    NSString *apresentacao = [NSString stringWithFormat:@"Olá, sou o %@, e meu email é %@", _nome,
                                                                                            _email];
    return apresentacao;
}

@end
