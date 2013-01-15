//
//  Funcionario.h
//  Hello World
//
//  Created by Maurílio Campos on 1/2/13.
//  Copyright (c) 2013 Kiwi Tecnologia. All rights reserved.
//

#import "Pessoa.h"

@interface Funcionario : Pessoa {
    NSString *_departamento;
    NSString *_cargo;
    float _salario;
}

-(id)initWithPessoa:(Pessoa*)pessoa departamento:(NSString*)departamento salario:(float)salario cargo:(NSString*)cargo;
-(id)init;

@property (nonatomic, strong) NSString *departamento;
@property (nonatomic, strong) NSString *cargo;
@property (nonatomic, readwrite) float salario;

@end
