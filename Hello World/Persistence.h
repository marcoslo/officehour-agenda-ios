//
//  Persistence.h
//  Hello World
//
//  Created by Maurílio Campos on 1/9/13.
//  Copyright (c) 2013 Kiwi Tecnologia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Persistence : NSObject {
    sqlite3 *_bancoDeDados;
    NSString *_path;
}

-(BOOL)incluir:(NSDictionary *)dados;
-(void)excluir:(NSDictionary *)dados;

@end
