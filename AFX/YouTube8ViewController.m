//
//  YouTube8ViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-11-10.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "YouTube8ViewController.h"

@interface YouTube8ViewController ()

@end

@implementation YouTube8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(40,250,300, 200)]; //(x,y,width,height)
    [self.webView setAllowsInlineMediaPlayback:YES];
    [self.webView setMediaPlaybackRequiresUserAction:NO];
    
    [self.view addSubview:self.webView];
    
    NSString* embedHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <body style='margin:0px;padding:0px;'>\
                           <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                           <script type='text/javascript'>\
                           function onYouTubeIframeAPIReady()\
                           {\
                           ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                           }\
                           function onPlayerReady(a)\
                           { \
                           a.target.playVideo(); \
                           }\
                           </script>\
                           <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                           </body>\
                           </html>", 300, 200, @"qzYe0Dl5JQg"];
    
    // first one vertical jump program
    // add JiIxesw_VEk vertical jump advance
    // add mBXdtdGPhXg agility advance
    // add y2D1sP9vi2Y agility program
    // add s1GZsVfywAM Essentric loading
    // add WKoFw03fQe0 Ankle sprain Program
    // add XOtRPsMr0Zw Planter Fascilities Program
    /* https://www.youtube.com/watch?v=qzYe0Dl5JQg
      https://www.youtube.com/watch?v=JkO3fdI-9n8
     https://www.youtube.com/watch?v=0NQmMp7x34Y
      https://www.youtube.com/watch?v=6nEFHgkOiO0
    */
    
    
    [self.webView loadHTMLString:embedHTML baseURL:[[NSBundle mainBundle] resourceURL]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
