//
//  Funcionario.m
//  Hello World
//
//  Created by Maurílio Campos on 1/2/13.
//  Copyright (c) 2013 Kiwi Tecnologia. All rights reserved.
//

#import "Funcionario.h"

@implementation Funcionario

-(NSString*)meApresentar
{
    NSString *apresentacao = [NSString stringWithFormat:@"Olá, sou o %@, e meu email é %@, trabalho no departamento %@ como %@ e recebo por mês %f.", _nome, _email, _departamento, _cargo, _salario];
    return apresentacao;
}

-(id)init
{
    self = [super init];
    if (self) {
        //seu código de inicialização aqui.
    }
    return self;
}


-(id)initWithPessoa:(Pessoa*)pessoa departamento:(NSString*)departamento salario:(float)salario cargo:(NSString*)cargo
{
    self = [super init];
    if (self) {
        _nome = [pessoa getNome];
        _email = [pessoa getEmail];
        _telefone = [pessoa getTelefone];
        _departamento = departamento;
        _salario = salario;
        _cargo = cargo;
    }
    return self;
}


@end
