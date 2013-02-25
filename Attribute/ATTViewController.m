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


- (IBAction)redButton {
    [self changeAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
}

- (IBAction)greenButton {
    [self changeAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor]}];
}

- (IBAction)blueButton {
    [self changeAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
}

- (IBAction)yellowButton {
    [self changeAttributes:@{NSForegroundColorAttributeName : [UIColor yellowColor]}];
}

- (IBAction)changeFont:(UIButton*)sender {
    // Take font from button, replace size with the one used in the sentence, apply
    // resulting font to the sentence

    UIFont* buttonFont = [[sender titleLabel] font];
    UIFont* sentenceFont = [self.sentence.attributedText attribute:NSFontAttributeName
                                                           atIndex:0
                                                    effectiveRange:NULL];
    UIFont* newFont = [buttonFont fontWithSize:[sentenceFont pointSize]];
    [self changeAttributes:@{NSFontAttributeName:newFont}];
    
}


- (IBAction)underline {
    [self changeAttributes: @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} ];
}


- (IBAction)noUnderline {
    [self changeAttributes: @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)} ];
}

- (IBAction)outline {

    // Don't understand what's going on here!  The foreground white is obscuring the stroke,
    // but only if the stroke colour is black!
    // Also, why changing the fg colour with the buttons loses the stroke attributes??
/*
 The value of NSStrokeWidthAttributeName controls this.  It should be a
 float-valued NSNumber, of which the absolute value controls the stroke
 width, and the sign controls the drawing mode; a positive value causes
 drawing using stroke alone, a negative value causes stroke and fill
 drawing, and zero (or no value) causes fill only.  If
 NSForegroundColorAttributeName is present, it is used as the fill color
 (if fill is drawn); if it is absent, the fill color is black (if fill
 is drawn).  If NSStrokeColorAttributeName is present, it is the color
 used for the stroke (if stroke is drawn); if it is absent, the fill
 color is also used for the stroke (if stroke is drawn).  See
 <AppKit/NSAttributedString.h>.
 */


    [self changeAttributes:
     @{NSStrokeWidthAttributeName: @(3.0)
//       NSStrokeColorAttributeName: [UIColor blackColor],
//       NSForegroundColorAttributeName: [UIColor yellowColor]
     }];
}



- (void) changeAttributes:(NSDictionary *) attrs {
    NSMutableAttributedString *newString = [self.sentence.attributedText mutableCopy];
    NSRange where = [[newString string] rangeOfString: self.selectedWord.text];
    [newString addAttributes:attrs range:where];
    self.sentence.attributedText = newString;
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
