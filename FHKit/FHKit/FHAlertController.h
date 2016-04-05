//
//  FHAlertController.h
//  FHAlertController
//
//  Created by MADAO on 16/4/1.
//  Copyright © 2016年 MADAO. All rights reserved.
//

/*UIAlertController
 _message-----@"NSString"
 _attributedTitle-----@"NSAttributedString"
 _attributedMessage-----@"NSAttributedString"
 _attributedDetailMessage-----@"NSAttributedString"
 _actionDelimiterIndices-----@"NSMutableArray"
 _linkedAlertControllers-----@"NSSet"
 _cancelAction-----@"UIAlertAction"
 _actionToKeyCommandsDictionary-----@"NSMutableDictionary"
 _keyCommandToActionMapTable-----@"NSMapTable"
 _resolvedStyle-----q
 _preferredStyle-----q
 _styleProvider-----@"NSObject<UIAlertControllerVisualStyleProviding>"
 _contentViewController-----@"UIViewController"
 _textFieldViewController-----@"_UIAlertControllerTextFieldViewController"
 _backButtonDismissGestureRecognizer-----@"UITapGestureRecognizer"
 _selectGestureRecognizer-----@"_UIAlertControllerSelectGestureRecognizer"
 _ownedTransitioningDelegate-----@
 _shouldInformViewOfAddedContentViewController-----B
 _isInSupportedInterfaceOrientations-----B
 _shouldEnsureContentControllerViewIsVisibleOnAppearance-----B
 _hidden-----B
 _ignoresKeyboardForPositioning-----B
 __shouldAllowNilParameters-----B
 _hasPreservedInputViews-----B
 __shouldFlipFrameForShimDismissal-----B
 _actions-----@"NSMutableArray"
 _preferredAction-----@"UIAlertAction"
 __presentationSourceRepresentationView-----@"UIView"
 __visualStyle-----@"UIAlertControllerVisualStyle"
 __compatibilityPopoverController-----@"UIPopoverController"
 __systemProvidedPresentationView-----@"UIView"
 __systemProvidedPresentationDelegate-----@"<UIAlertControllerSystemProvidedPresentationDelegate>"
 _systemProvidedGestureRecognizer-----@"UIGestureRecognizer"
 _temporaryAnimationCoordinator-----@"_UIAnimationCoordinator"
 _previewInteractionController-----@"UIPreviewInteractionController"
 */

/*UIAlertAction
 _title-----@"NSString"
 _titleTextAlignment-----q
 _enabled-----B
 _checked-----B
 _isPreferred-----B
 _imageTintColor-----@"UIColor"
 _titleTextColor-----@"UIColor"
 _style-----q
 _handler-----@?
 _simpleHandler-----@?
 _image-----@"UIImage"
 _shouldDismissHandler-----@?
 __descriptiveText-----@"NSString"
 _contentViewController-----@"UIViewController"
 _keyCommandInput-----@"NSString"
 _keyCommandModifierFlags-----q
 __representer-----@"<UIAlertActionViewRepresentation_Internal>"
 __alertController-----@"UIAlertController"
*/

//    Way to get invisible property:
//    unsigned int count = 0;
//    Ivar *var = class_copyIvarList([UIAlertAction class], &count);
//    for (int i = 0 ;i < count ;i++) {
//        Ivar _var = *(var + i);
//        NSLog(@"%s-----%s",ivar_getName(_var),ivar_getTypeEncoding(_var));
//    }
//    NSLog(@"================");
//    unsigned int count1 = 0;
//    Ivar *var1 = class_copyIvarList([UIAlertController class], &count1);
//    for (int i = 0 ;i < count1 ;i++) {
//        Ivar _var = *(var1 + i);
//        NSLog(@"%s-----%s",ivar_getName(_var),ivar_getTypeEncoding(_var));
//    }

#import <UIKit/UIKit.h>

@interface FHAlertController : UIAlertController

@property (nonatomic, strong) NSAttributedString *fhAttributedTitle;

@property (nonatomic, strong) NSAttributedString *fhAttributedMessage;

@property (nonatomic, strong) UIColor *buttonTitleColor;               //Uniform color settings

- (void)addActionArray:(NSArray *)actionArray;   

@end

@interface FHAlertAction : UIAlertAction

@property (nonatomic, strong) UIColor *fhTitleColor;

@property (nonatomic, strong) NSString *fhDescriptiveText;               //Add a subtitle besides of button's title with a blank space.But same color.
                                                                         //With set fhTitleTextAlignment,both can only use one,otherwise project will crash.

@property (nonatomic, strong) NSString *fhKeyCommandInput;               //For example, if fhKeyCommandInput was setted "f",then you can trig the action with keyboard "F"

@property (nonatomic, assign) NSTextAlignment fhTitleTextAlignment;      //For now, there is no difference before or after the set, but I kept it.

@property (nonatomic, strong) UIImage *fhImage;                          //Easily set an image besides of the button's title. Suggest setting the “fhImageTintColor” at the same time,otherwise the image will be ugly.

@property (nonatomic, strong) UIColor *fhImageTintColor;

@property (nonatomic, assign) BOOL fhEnabled;                            //Default is "YES".If set "NO",the action button will be untouchable.

@property (nonatomic, assign) BOOL fhChecked;                            //Nothing difference but I kept it.

@property (nonatomic, assign) BOOL fhIsPreferred;                        //Nothing difference but I kept it.


@end