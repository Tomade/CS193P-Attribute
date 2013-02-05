//
//  ATTViewController.m
//  Attribute
//
//  Created by Danilo Fiorenzano on 2013-02-04.
//  Copyright (c) 2013 Danilo Fiorenzano. All rights reserved.
//

#import "ATTViewController.h"

@interface ATTViewController ()
@property (weak, nonatomic) IBOutlet UILabel *selectedWord;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UITextView *sentence;
@property (strong, nonatomic) NSArray *words;
@end

@implementation ATTViewController


- (NSArray*) words
{
    if (!_words)
        _words = [[self.sentence.attributedText string]
                 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return _words;
}



- (IBAction)selectWord {

    self.selectedWord.text = self.words[(int)self.stepper.value];
}








- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.stepper.maximumValue = self.words.count - 1;
    self.selectedWord.text = self.words[0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
