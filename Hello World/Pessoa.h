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

@interface Pessoa : NSObject {
    NSString *_nome;
    NSString *_email;
}

-(NSString*) meApresentar;
-(void)setNome:(NSString*)nome email:(NSString*)email;

@end
