//
//  JTStyledTextView.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/25/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledTextView.h"
#import "AdvancedGraphics.h"

@implementation JTStyledTextView

@synthesize placeHolderLabel=_placeHolderLabel;
@synthesize placeholder=_placeholder;
@synthesize placeholderColor=_placeholderColor;

@synthesize symbolsRestLabel=_symbolsRestLabel;


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.placeHolderLabel = nil;
    self.placeholderColor = nil;
    self.placeholder = nil;
    
    self.symbolsRestLabel=nil;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setPlaceholder:@""];
    [self setPlaceholderColor:[UIColor lightGrayColor]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
        
        self.symbolsRestLabel=[[UILabel alloc] initWithFrame:CGRectZero];
        self.symbolsRestLabel.text=[NSString stringWithFormat:@"%d",MAX_SYMBOLS_COUNT];
        self.symbolsRestLabel.backgroundColor=[UIColor clearColor];
        self.symbolsRestLabel.font=[UIFont fontWithName:@"Helvetica-Oblique" size:12.f];
        self.symbolsRestLabel.textAlignment=UITextAlignmentRight;
        [self addSubview:self.symbolsRestLabel];
        
        
    }
    return self;
}



-(void)_trimSymbols
{
    if([[self text] length] > MAX_SYMBOLS_COUNT)
    {
        self.text=[self.text substringWithRange:NSMakeRange (0, MAX_SYMBOLS_COUNT)];
    }

}






- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    if([[self text] length] == 0)
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    else
    {
        [[self viewWithTag:999] setAlpha:0];
    }
    
    //
    //
    //
    NSUInteger restSymbolsCount=MAX_SYMBOLS_COUNT-[self.text length];
    self.symbolsRestLabel.text=[NSString stringWithFormat:@"%d",restSymbolsCount];
    [self setNeedsLayout];
    
    [self _trimSymbols];
}


- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    drawMetroStyleFillinContext(ctx,rect);
    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorSpaceRef cspace = CGColorSpaceCreateDeviceRGB();
    
    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(ctx,self.bounds);
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat dh = (w-h)/2;
    
    CGLayerRef l = CGLayerCreateWithContext(ctx,CGSizeMake(h,48.0f),NULL);
    CGContextRef lctx = CGLayerGetContext(l);
    
    float comp[] = { .2,.5,1.0,1.0,1.0,1.0,1.0,1.0};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(cspace, comp, NULL, 2);
    CGContextDrawLinearGradient(lctx, gradient,CGPointMake(0,0),CGPointMake(0,48), 0);
    
    CGContextSaveGState(ctx);
    CGContextSetBlendMode(ctx,kCGBlendModeDarken);
    for(int n=1;n<5;n++)
    {
        CGContextTranslateCTM(ctx,w/2.0,h/2.0);
        CGContextRotateCTM(ctx, M_PI_2);
        CGContextTranslateCTM(ctx,-w/2.0,-h/2.0);
        CGContextDrawLayerAtPoint(ctx,CGPointMake((n%2)*dh,(n%2)*-dh),l);
    }
    CGContextRestoreGState(ctx);
    
    */
    
    if( [[self placeholder] length] > 0 )
    {
        if ( self.placeHolderLabel == nil )
        {
            self.placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            self.placeHolderLabel.lineBreakMode = UILineBreakModeWordWrap;
            self.placeHolderLabel.numberOfLines = 0;
            self.placeHolderLabel.font = self.font;
            self.placeHolderLabel.backgroundColor = [UIColor clearColor];
            self.placeHolderLabel.textColor = self.placeholderColor;
            self.placeHolderLabel.alpha = 0;
            self.placeHolderLabel.tag = 999;
            [self addSubview:self.placeHolderLabel];
        }
        
        self.placeHolderLabel.text = self.placeholder;
        [self.placeHolderLabel sizeToFit];
        [self sendSubviewToBack:self.placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
    
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width=(self.contentSize.width>CGRectGetWidth(self.bounds)) ? self.contentSize.width :CGRectGetWidth(self.bounds);
    CGFloat height=(self.contentSize.height>CGRectGetHeight(self.bounds)) ? self.contentSize.height :CGRectGetHeight(self.bounds);
    
    self.symbolsRestLabel.frame=CGRectMake( width-30-7, height-20, 30, 20);
}



@end