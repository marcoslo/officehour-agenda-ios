//
//  Persistence.m
//  Hello World
//
//  Created by Maurílio Campos on 1/9/13.
//  Copyright (c) 2013 Kiwi Tecnologia. All rights reserved.
//

#import "Persistence.h"

@interface Persistence(Privado)
-(void) verificarBanco;
-(NSString*) montarSQL:(NSDictionary *)dados;
@end

@implementation Persistence


-(id) init
{
    if (self == [super init]) {
        [self verificarBanco];
        
        NSDictionary *teste = @{
                                    @"tabela" : @"pessoa",
                                    @"campos" :
                                        @[
                                            @{ @"campo": @"nome", @"valor" : @"Maurilio" },
                                            @{ @"campo": @"email", @"valor" : @"mauriliohrc@gmail.com" },
                                            @{ @"campo": @"numero", @"valor" : @20 }
                                         ]
        };
        
        NSString *sql = [self montarSQL:teste];
        NSLog(@"SQL: %@", sql);
        
    }
    return self;
}


-(void)excluir:(NSDictionary *)dados
{
    /*
        @{
            @"tabela" : @"pessoa",
            @"valor"  : @3 
         }
     */
    
    NSString *tabela = [dados objectForKey:@"tabela"];
    NSString *valor = [[dados objectForKey:@"valor"] stringValue];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id = %@", tabela, valor];
    
    if (sqlite3_open([_path UTF8String], &_bancoDeDados) == SQLITE_OK) {
        char *erro;
        if (sqlite3_exec(_bancoDeDados, [sql UTF8String], NULL, NULL, &erro) == SQLITE_OK) {
            NSLog(@"Registro excluido");
        } else {
            NSLog(@"Falha ao executar sql: %@", sql);
        }
        
        sqlite3_close(_bancoDeDados);
    } else {
        NSLog(@"Falha ao abrir banco: %@", _path);
    }
    
}



-(BOOL)incluir:(NSDictionary *)dados
{
    if (sqlite3_open([_path UTF8String], &_bancoDeDados) == SQLITE_OK) {
        
        NSString *sql = [self montarSQL:dados];
        char *erro;
        
        if (sqlite3_exec(_bancoDeDados, [sql UTF8String], NULL, NULL, &erro) == SQLITE_OK) {
            NSLog(@"Registro incluso com sucesso");
            return YES;
        } else {
            NSLog(@"Falha ao incluir, SQL: %@", sql);
            return NO;
        }
        
        sqlite3_close(_bancoDeDados);
    } else {
        return NO;
        NSLog(@"Falha ao abrir o banco no caminho: %@", _path);
    }
}


/*
 
    @{
        @"tabela" : @"pessoa",
        @"campos" : 
        @[
            @{ @"campo": @"nome", @"valor" : @"Maurilio" },
            @{ @"campo": @"email", @"valor" : @"mauriliohrc@gmail.com" },
            @{ @"campo": @"numero", @"valor" : @20 } 
        ]
    }
 
 */

-(NSString*) montarSQL:(NSDictionary *)dados
{
    
    NSArray *campos = [dados objectForKey:@"campos"];
    NSString *tabela = [dados objectForKey:@"tabela"];
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@(", tabela];
    
    int index = 0;
    int total = [campos count];
    
    for (NSDictionary *campo in campos) {
        NSString *nome = [campo objectForKey:@"campo"];
        if (index++ != total - 1) {
            nome = [nome stringByAppendingString:@", "];
        } else {
            nome = [nome stringByAppendingString:@") "];
        }
        sql = [sql stringByAppendingString:nome];
    }


    index = 0;
    sql = [sql stringByAppendingString:@" VALUES("];
    for (NSDictionary *campo in campos) {
        NSString *valor;
        if ([[campo objectForKey:@"valor"] isKindOfClass:[NSString class]]) {
            valor = [NSString stringWithFormat:@" '%@' ", [campo objectForKey:@"valor"]];
        } else {
            valor = [NSString stringWithFormat:@" %@ ", [campo objectForKey:@"valor"]];
        }
        
        if (index++ != total -1) {
            valor = [valor stringByAppendingString:@", "];
        } else {
            valor = [valor stringByAppendingString:@") "];
        }
        sql = [sql stringByAppendingString:valor];
    }
    return sql;
}



-(void)verificarBanco
{
    //obtendo os paths
    NSString *pathDefault = [[NSBundle mainBundle] pathForResource:@"banco" ofType:@"sqlite"];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingFormat:@"/banco0.1.sqlite"];
    
    NSLog(@"Banco modelo: %@", pathDefault);
    NSLog(@"Caminho do banco que vamos utilizar: %@", path);

    // Verificando se o arquivo existe
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        
        NSError *error;
        if ([fileManager copyItemAtPath:pathDefault toPath:path error:&error]) {
            if (error) {
                NSLog(@"Ocorreu uma falha: %@ ", error);
            } else {
                NSLog(@"Arquivo copiado com sucesso.");
            }
        } else {
            NSLog(@"Ocorreu uma falha ao executar a copia");
        }
        
    } else {
        NSLog(@"O arquivo existe.");
    }
    
    _path = path;
}



@end
