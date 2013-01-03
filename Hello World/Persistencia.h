//
//  Persistencia.h
//  Hello World
//
//  Created by Maurílio Campos on 1/3/13.
//  Copyright (c) 2013 Kiwi Tecnologia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Persistencia

@required

-(BOOL)salvar;
-(BOOL)excluir;

@optional

-(void)dizerOla;

@end
