//
//  ViewController.m
//  webview
//
//  Created by Justin Lee on 2016. 2. 5..
//  Copyright © 2016년 Interpark Ticket. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftWebViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightWebViewConstraint;


@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSURL * url = [NSURL URLWithString:@"http://marumaru.in/b/manga/65484"];
    NSURL * url = [NSURL URLWithString:@"http://www.marumaru.in/c/26"];
    
    NSURLRequest * urlRequest = [[NSURLRequest alloc]initWithURL:url];
    [_webview loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)doBackButton:(id)sender {
//    [_webview goBack];
//}

- (IBAction)fitButton:(id)sender {

    if ( self.leftWebViewConstraint.constant == 0) {
        self.leftWebViewConstraint.constant = -23;
        
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
            self.leftWebViewConstraint.constant = -40;
            self.rightWebViewConstraint.constant = -300;
        }
        else {
            self.leftWebViewConstraint.constant = -23;
            self.rightWebViewConstraint.constant = -23;
        }
        
    }
    else {
        self.leftWebViewConstraint.constant = 0;
        self.rightWebViewConstraint.constant = 0;
    }
    
}



- (void)webViewDidStartLoad:(UIWebView *)webView {
    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    _activityIndicatorView.hidden = YES;
    [_activityIndicatorView stopAnimating];
    
        [self checkWebNavigationButton];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    _activityIndicatorView.hidden = YES;
    [_activityIndicatorView stopAnimating];
    
    [self checkWebNavigationButton];
}


- (void)checkWebNavigationButton{

    _backButton.hidden = ![_webview canGoBack];
    _forwardButton.hidden = ![_webview canGoForward];
}

@end
