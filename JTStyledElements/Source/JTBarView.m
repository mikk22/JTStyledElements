//
//  JTButtonsBarView.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 6/15/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTBarView.h"

@interface JTBarView ()
{
    NSDictionary *_barButtons;
}
    
@property (nonatomic, strong)   NSDictionary    *barButtons;

-(void)_setButtonsSize:(CGSize)buttonSize;
-(void)_barButtonTouch:(id)sender;
-(void)_removeButtonsFromSuperview;
-(void)_loadButtons;
@end



@implementation JTBarView


@synthesize barButtons=_barButtons;
@synthesize barDataSource=_barDataSource;
@synthesize barDelegate=_barDelegate;


@synthesize horizontalOffset=_horizontalOffset;
@synthesize verticalOffset=_verticalOffset;
@synthesize barButtonSize=_barButtonSize;
@synthesize barStyle=_barStyle;
@synthesize allowsMultipleSelection=_allowsMultipleSelection;
@synthesize centerContent=_centerContent;
@synthesize selectedIndexes=_selectedIndexes;



#pragma mark -
#pragma mark Bar LifeCycle

/*
-(id<JTButtonsBarViewDelegate>)delegate
{
    return _delegate;
}

-(void)setDelegate:(id<JTButtonsBarViewDelegate>)delegate
{
    _delegate=delegate;
}
*/



-(void)dealloc
{
    self.barButtons=nil;
    self.selectedIndexes=nil;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        self.delegate=self;
        
        self.canCancelContentTouches=YES;
        self.scrollEnabled = YES;
        self.pagingEnabled = NO;
        self.showsVerticalScrollIndicator=NO;
        self.showsHorizontalScrollIndicator=NO;
        self.delaysContentTouches=YES;
        
        self.backgroundColor=[UIColor colorWithWhite:0.f alpha:0.7];
        _horizontalOffset=METRO_CELL_LEFT_OFFSET;//_BAR_BUTTON_LEFT_OFFSET;
        _verticalOffset=METRO_CELL_LEFT_OFFSET;//_BAR_BUTTON_TOP_OFFSET;
    }

    return self;
}




- (id)initWithStyle:(JTButtonsBarStyle)style
{
    self=[self initWithFrame:CGRectZero];
    if (self)
    {
        self.barStyle=style;
    }

    return self;
}


#pragma mark - Internal messages -



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!_initialized)
    {
        _buttonsCount=0;
        NSUInteger _sections=[self.barDataSource numberOfSectionsInBarView:self];
        for (NSUInteger index=0; index<_sections; ++index)
        {
            _buttonsCount=_buttonsCount+[self.barDataSource numberOfItemsInBarView:self forSection:index];
        }
        
        [self reloadData];
        _initialized=YES;
    }

    switch (self.barStyle) 
    {
        case JTButtonsBarVerticalStyle:
        {
            CGFloat buttonWidth=CGRectGetWidth(self.frame)-2*self.horizontalOffset;
            CGSize buttonSize=!CGSizeEqualToSize(self.barButtonSize, CGSizeZero) ? self.barButtonSize :
                                                            CGSizeMake(buttonWidth,buttonWidth);
            
            [self _setButtonsSize:buttonSize];
            
            CGFloat contentHeight=_buttonsCount*(buttonWidth+self.verticalOffset)+self.verticalOffset;
            [self setContentSize:CGSizeMake(CGRectGetWidth(self.frame), contentHeight)];

            break;
        }    
        default:
        case JTButtonsBarHorizontalStyle:
        {
            CGFloat buttonWidth=CGRectGetHeight(self.frame)-2*self.verticalOffset;
            CGSize buttonSize=!CGSizeEqualToSize(self.barButtonSize, CGSizeZero) ? self.barButtonSize :
            CGSizeMake(buttonWidth,buttonWidth);
            [self _setButtonsSize:buttonSize];//CGSizeMake(buttonWidth, buttonWidth)];
            CGFloat contentWidth=_buttonsCount*(buttonWidth+self.horizontalOffset)+self.horizontalOffset;
            [self setContentSize:CGSizeMake(contentWidth, CGRectGetHeight(self.frame))];
            
            break;
        }    
    }
    
}



-(void)_setButtonsSize:(CGSize)buttonSize
{
    NSArray *allKeys=[[self.barButtons allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSUInteger  buttonIndex=0;
    for (NSString *key in allKeys)
    {
        NSArray *buttons=![[self.barButtons objectForKey:key] isEqual:[NSNull null]] ? [self.barButtons objectForKey:key] : nil;
        if ([buttons count])
        {
            for (UIView *button in buttons)
            {
                switch (self.barStyle) 
                {
                    case JTButtonsBarVerticalStyle:
                    {
                        button.frame=CGRectMake(CGRectGetMidX(self.bounds)-buttonSize.width/2, self.verticalOffset+buttonIndex*(self.verticalOffset+buttonSize.height), buttonSize.width, buttonSize.height);
                        
//                        button.frame=CGRectMake(self.horizontalOffset, self.verticalOffset+buttonIndex*(self.verticalOffset+buttonSize.height), buttonSize.width, buttonSize.height);
                        break;
                    }    
                    default:
                    case JTButtonsBarHorizontalStyle:
                    {
                        button.frame=CGRectMake(self.horizontalOffset+buttonIndex*(self.horizontalOffset+buttonSize.width), 
                                                CGRectGetMidY(self.bounds)-buttonSize.height/2,
                                                buttonSize.width,
                                                buttonSize.height);
                        break;
                    }    
                }
                ++buttonIndex;
            }
        }
    }
}









-(void)_barButtonTouch:(id)sender
{
    UIControl   *barButton=(UIControl*)sender;

    //searching section for button
    NSArray *allKeys=[[self.barButtons allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString *buttonSectionKey in allKeys)
    {
        NSArray *buttonsInSection=![[self.barButtons objectForKey:buttonSectionKey] isEqual:[NSNull null]] ?
                                            [self.barButtons objectForKey:buttonSectionKey] : nil;
        if ([buttonsInSection count])
        {
            NSUInteger buttonRowIndex=[buttonsInSection indexOfObject:sender];
            if (buttonRowIndex != NSNotFound)
            {
                if (!self.allowsMultipleSelection)
                {
                    BOOL buttonWasSelected=barButton.selected;
                    
                    for (UIControl *btn in buttonsInSection)
                    {
                        [btn setSelected:NO];
                    }
                    
                    if (!buttonWasSelected)
                        barButton.selected=YES;
                } else 
                {
                    barButton.selected=!barButton.selected;
                }
            
                
                NSUInteger buttonSectionIndex=[allKeys indexOfObject:buttonSectionKey];
                
                
                if ([self.barDelegate respondsToSelector:@selector(barView:button:forIndexPathTouched:)])
                    [self.barDelegate barView:self button:sender forIndexPathTouched:[NSIndexPath indexPathForRow:buttonRowIndex inSection:buttonSectionIndex]];
                
                break;
            }
        }
    }
    
    
    /*
    //setting output selected array
    NSUInteger  btnIndex=0;
    NSMutableArray *selectedIndexes=[NSMutableArray array];
    for (UIControl *btn in self.barButtons)
    {
        if (btn.selected)
            [selectedIndexes addObject:[NSNumber numberWithInteger:btnIndex]];
        
        ++btnIndex;
    }
    
    self.selectedIndexes=[NSArray arrayWithArray:selectedIndexes];
    
    if ([self.dataSource respondsToSelector:@selector(buttonsBarViewSelectionChanged:)])
        [self.dataSource buttonsBarViewSelectionChanged:self];
    */
}




#pragma mark - Properties -

-(NSArray*)allButtons
{
    NSMutableArray *allButtons=[NSMutableArray array];
    NSArray *allKeys=[[self.barButtons allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in allKeys)
    {
        NSArray *buttons=![[self.barButtons objectForKey:key] isEqual:[NSNull null]] ? [self.barButtons objectForKey:key] : nil;
        if ([buttons count])
        {
            [allButtons addObjectsFromArray:buttons];
        }
    }
    
    return [NSArray arrayWithArray:allButtons];
}


-(void)setCenterContent:(BOOL)centerContent
{
    _centerContent=centerContent;
    [self setNeedsLayout];
}




-(void)setBarButtonSize:(CGSize)barButtonSize
{
    _barButtonSize=barButtonSize;
    [self setNeedsLayout];
}




-(void)setHorizontalOffset:(CGFloat)horizontalOffset
{
    _horizontalOffset=horizontalOffset;
    [self setNeedsLayout];
}


-(void)setVerticalOffset:(CGFloat)verticalOffset
{
    _verticalOffset=verticalOffset;
    [self setNeedsLayout];
}



-(void)setBarStyle:(JTButtonsBarStyle)barStyle
{
    _barStyle=barStyle;
    [self setNeedsLayout];
}




-(NSDictionary*)buttons
{
    return self.barButtons;
}




-(NSArray*)selectedIndexes
{
if (!_selectedIndexes)
    _selectedIndexes=[NSArray array];
    return _selectedIndexes;
}




-(void)_removeButtonsFromSuperview
{
    NSArray *allKeys=[self.barButtons allKeys];
    for (NSString *key in allKeys)
    {
        NSArray *buttons=![[self.barButtons objectForKey:key] isEqual:[NSNull null]] ? [self.barButtons objectForKey:key] : nil;
        if ([buttons count])
            [buttons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
}


-(void)_loadButtons
{
    //clearing all data
    NSMutableDictionary *buttons=[NSMutableDictionary dictionaryWithCapacity:_buttonsCount];
    //loading buttons from dataSource
    NSUInteger sections=[self.barDataSource numberOfSectionsInBarView:self];
    
    for (NSUInteger sectionIndex=0; sectionIndex<sections; ++sectionIndex)
    {
        NSUInteger buttonsCountForSection=[self.barDataSource numberOfItemsInBarView:self forSection:sectionIndex];
        NSMutableArray *buttonsForSection=[NSMutableArray arrayWithCapacity:buttonsCountForSection];
        for (NSUInteger buttonIndex=0; buttonIndex<buttonsCountForSection; ++buttonIndex)
        {
            UIView *itemView=[self.barDataSource barView:self itemForIndexPath:[NSIndexPath indexPathForRow:buttonIndex inSection:sectionIndex]];
            
            if ([itemView isKindOfClass:[UIControl class]])
            {
                UIControl *itemControl=(UIControl*)itemView;
                [itemControl addTarget:self action:@selector(_barButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            [buttonsForSection addObject:itemView];
            [self addSubview:itemView];
        }
        
        [buttons setObject:[NSArray arrayWithArray:buttonsForSection] forKey:[NSString stringWithFormat:@"%d",sectionIndex]];
    }
    
    self.barButtons=[NSDictionary dictionaryWithDictionary:buttons];
}


#pragma mark -
#pragma mark - External Messages






-(void)reloadData
{
    ///remove old buttons from superview
    [self _removeButtonsFromSuperview];
    [self _loadButtons];
    
    
    switch (self.barStyle) 
    {
        case JTButtonsBarVerticalStyle:
        {
            CGFloat buttonWidth=CGRectGetWidth(self.bounds)-2*self.horizontalOffset;
            //CGSize buttonSize=!CGSizeEqualToSize(self.barButtonSize, CGSizeZero) ? self.barButtonSize :
            CGSizeMake(buttonWidth,buttonWidth);
            
            CGFloat contentHeight=_buttonsCount*(buttonWidth+self.verticalOffset)+self.verticalOffset;
            [self setContentSize:CGSizeMake(CGRectGetWidth(self.frame), contentHeight)];
            
            if (self.centerContent &&  (contentHeight<CGRectGetHeight(self.frame)) )
                self.contentOffset=CGPointMake(0, -( (CGRectGetHeight(self.frame)-contentHeight)/2 ));
            else 
                self.contentOffset=CGPointMake(0, 0);
            break;
        }    
        default:
        case JTButtonsBarHorizontalStyle:
        {
            CGFloat buttonWidth=CGRectGetHeight(self.frame)-2*self.verticalOffset;
            //CGSize buttonSize=!CGSizeEqualToSize(self.barButtonSize, CGSizeZero) ? self.barButtonSize :
            CGSizeMake(buttonWidth,buttonWidth);

            CGFloat contentWidth=_buttonsCount*(buttonWidth+self.horizontalOffset)+self.horizontalOffset;
            [self setContentSize:CGSizeMake(contentWidth, CGRectGetHeight(self.frame))];

            if (self.centerContent &&  (contentWidth<CGRectGetWidth(self.frame)))
                self.contentOffset=CGPointMake(-( (CGRectGetWidth(self.frame)-contentWidth)/2 ),0);
            else 
                self.contentOffset=CGPointMake(0, 0);
            
            break;
        }    
    }
    
    [self setNeedsDisplay];
}




- (UIControl*)buttonAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *buttons=![[self.barButtons objectForKey:[NSString stringWithFormat:@"%d",indexPath.section]] isEqual:[NSNull null]] ? 
                                                    [self.barButtons objectForKey:[NSString stringWithFormat:@"%d",indexPath.section]] : nil;
    
    UIControl *button=nil;
    if (buttons)
        button=!(indexPath.row>[buttons count]) ? nil : [buttons objectAtIndex:indexPath.row];
    return button;
}





- (void)resetSelection
{
    NSArray *allKeys=[self.barButtons allKeys];
    for (NSString *key in allKeys)
    {
        NSArray *buttons=![[self.barButtons objectForKey:key] isEqual:[NSNull null]] ? [self.barButtons objectForKey:key] : nil;
        for (UIControl *control in buttons)
        {
            control.selected=NO;
        }
    }
}


@end
