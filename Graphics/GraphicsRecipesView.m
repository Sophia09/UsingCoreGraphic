//
//  GraphicsRecipesView.m
//  Graphics
//
//  Created by thinkit  on 8/12/14.
//
//

#import "GraphicsRecipesView.h"

@implementation GraphicsRecipesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Obtain a reference to the current context
    CGContextRef context = UIGraphicsGetCurrentContext();

    [self drawRectangleAtTopOfScreen:context];
    
    [self drawEllipse:context];
    
    [self drawTriangle:context];
    
    [self drawArc:context];
    
    [self drawTextAtTopOfScreen:context];
}

#pragma mark - Helper Method

- (void)drawRectangleAtTopOfScreen:(CGContextRef)context
{
    // Call ContextSave and ContextRestore ti make sure that a change to context
    // will only apply to this one function.
    CGContextSaveGState(context);
    [[UIColor lightGrayColor] set];
    
    CGRect rectangleRect = CGRectMake(0.0f, 0.0f, 320.0f, 60.0f);
    CGContextFillRect(context, rectangleRect);
    CGContextRestoreGState(context);
}

- (void)drawEllipse:(CGContextRef)context
{
    CGContextSaveGState(context);
    [[UIColor whiteColor] set];
    
    // Set shadow and shadow color
    CGContextSetShadowWithColor(context, CGSizeMake(10.0f, 10.0f), 10.0f, [[UIColor redColor] CGColor]);
    
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    CGContextFillEllipseInRect(context, ellipseRect);
    CGContextRestoreGState(context);
}

- (void)drawTriangle:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Set color of current context
    [[UIColor colorWithRed:0.8f
                    green:0.85f
                     blue:0.95f
                    alpha:1.0f] set];
    
    // Draw triangle
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 140.0f, 380.0f);
    CGContextAddLineToPoint(context, 190.0f, 400.0f);
    CGContextAddLineToPoint(context, 140.0f, 420.0f);
    CGContextClosePath(context);
    CGContextSetGrayFillColor(context, 0.1f, 0.85f);
    CGContextSetGrayStrokeColor(context, 0.0f, 0.0f);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
}

- (void)drawArc:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Set color of current context
    [[UIColor colorWithRed:0.30f
                    green:0.30f
                     blue:0.30f
                    alpha:1.0f] set];
    
    // Draw arc
    CGContextAddArc(context, 160.0f, 250.0f, 70.0f, 0.0f, 3.14f, 0);
    CGContextSetLineWidth(context, 20.0f);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextRestoreGState(context);
}

- (void)drawTextAtTopOfScreen:(CGContextRef)context
{
    CGContextSaveGState(context);

    // Set shadow and shadow color
    CGContextSetShadowWithColor(context, CGSizeZero, 20.0f, [[UIColor redColor] CGColor]);
    
    // Create UIColor to pass into the text Attributes
    UIColor *textColor = [UIColor colorWithRed:0.80f
                                         green:0.85f
                                          blue:0.95f
                                         alpha:1.0f];
    // Set font
    UIFont *customFont = [UIFont fontWithName:@"OleoScriptSwashCaps-Bold" size:40.0f];
    NSString *titleText = @"Hello, world!";
    [titleText drawAtPoint:CGPointMake(55, 5)
            withAttributes:@{NSFontAttributeName:customFont,
                             NSForegroundColorAttributeName:textColor}];
    
    
    CGContextRestoreGState(context);
}

@end
