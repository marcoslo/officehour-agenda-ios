//
//  Pessoa.h
//  Hello World
//
//  Created by Maurílio Campos on 12/29/12.
//  Copyright (c) 2012 Kiwi Tecnologia. All rights reserved.
//

/*
  Meu iComentario.
 */

#import <Foundation/Foundation.h>
#import "Persistencia.h"

@interface Pessoa : NSObject <Persistencia> {
    
    @protected
    NSString *_nome;
    NSString *_email;
    NSNumber *_telefone;
    
}

-(NSString*) meApresentar;
-(void)setNome:(NSString*)nome email:(NSString*)email;

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSNumber *telefone;

@end
