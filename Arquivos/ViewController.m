//
//  ViewController.m
//  Arquivos
//
//  Created by Leonardo on 31/08/13.
//  Copyright (c) 2013 Leonardo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) InstanciaArquivo {
    NSFileManager *filemgr = [NSFileManager defaultManager];
    NSString *arquivo = @"myfile.txt";
    
    NSString *DiretorioRoot = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *storePath = [DiretorioRoot stringByAppendingPathComponent:arquivo];
    
    //NSLog(@"Arquivo: %@", arquivo);
    //NSLog(@"DiretorioRoot: %@", DiretorioRoot);
    NSLog(@"StorePath: %@",storePath);
    
    //NSString *storePath = [applicationDocumentsDir stringByAppendingPathComponent:@"myfile.txt";
    
    if ([filemgr fileExistsAtPath:DiretorioRoot])
        NSLog(@"DiretorioRoot existe"); //Verifies is directory exists
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:storePath]) {
        NSLog(@"Arquivo da aplicação existe");
    }
    else {
        //[filemgr createFileAtPath: storePath contents: nil attributes:nil];
        NSLog(@"Arquivo da aplicação não existe");
    }
    
    return storePath;
}
- (void) gravarArquivo: (NSString *) storePath textoParaGravar: (NSString *) conteudo {
    
    NSError *saveError = nil;
    
    //[conteudo writeToFile:storePath atomically:NO encoding:NSUTF8StringEncoding error:&saveError]
    //[conteudo writeToFile:storePath atomically:NO encoding:NSStringEncodingConversionAllowLossy error:&saveError]
    
    
    if (![conteudo writeToFile:storePath atomically:NO encoding:NSUTF8StringEncoding error:&saveError]) {
        NSLog(@"Erro na hora de salvar o arquivo: %@",saveError);
    }
    else {
        NSLog(@"Gravação realizada com sucesso.");
    }
}

- (void) gravarArquivo{
    
    NSString *storePath = [self InstanciaArquivo];
    NSString *conteudo = @"Teste teste teste";
    
    [self gravarArquivo:storePath textoParaGravar:conteudo];
    
}

- (NSString *) lerArquivo {
    
    NSString *storePath = [self InstanciaArquivo];
    return [self lerArquivo:storePath];
}

- (NSString *) lerArquivo: (NSString *) storePath {
    
    NSString *conteudo = [[NSString alloc] initWithContentsOfFile:storePath encoding:NSUTF8StringEncoding error:nil];
    return conteudo;
}


- (IBAction)btnAcao:(id)sender {
    
    NSString *storePath = [self InstanciaArquivo];
    
    
    NSString *textoParaGravar = self.txtText.text;
    //NSLog(@"%@",textoParaGravar);
    
    [self gravarArquivo:storePath textoParaGravar:textoParaGravar];
    
    
}

- (IBAction)btnLer:(id)sender {
    
    NSString *storePath = [self InstanciaArquivo];
    NSString *conteudo = [self lerArquivo:storePath];
    
    self.lblLabel.text = conteudo;
    
}

- (IBAction)dragEnter:(id)sender {
    
    NSLog(@"dragEnter");
}

- (IBAction)dragExit:(id)sender {
    
    NSLog(@"dragExit");
}

@end
