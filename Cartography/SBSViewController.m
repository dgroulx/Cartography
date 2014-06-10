//
//  SBSViewController.m
//  Cartography
//
//  Created by David Groulx on 6/10/14.
//  Copyright (c) 2014 David Groulx. All rights reserved.
//

#import "SBSViewController.h"

@interface SomeLocation : NSObject <MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@end

@implementation SomeLocation

- (NSString *)title {
  return @"The Factory";
}

- (NSString *)subtitle {
  return @"http://www.workthefactory.com";
}

@end


@interface SBSViewController ()

@end

@implementation SBSViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  CLLocationCoordinate2D theFactoryLocation = CLLocationCoordinate2DMake(42.963099, -85.669536);
  MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.05, 0.05);
  self.mappy.region = MKCoordinateRegionMake(theFactoryLocation, coordinateSpan);
  
  SomeLocation* factoryAnnotation = [[SomeLocation alloc] init];
  factoryAnnotation.coordinate = theFactoryLocation;
  [self.mappy addAnnotation:factoryAnnotation];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
