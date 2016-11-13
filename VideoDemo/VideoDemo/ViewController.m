//
//  ViewController.m
//  VideoDemo
//
//  Created by JunfengLi on 16/11/13.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

NSString * const VideoURLStr = @"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4";

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) MPMoviePlayerController *playerController;
@property (nonatomic, strong) MPMoviePlayerViewController *playerViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (IBAction)playVideo:(id)sender
{
    [self playVideoWithAVPlayer];
//    [self playVideoWithMoviePlayerController];
//    [self playVideoWithMoviePlayerViewController];
}

- (void)playVideoWithAVPlayer
{
    [self player];
    [self.player play];
}

- (void)playVideoWithMoviePlayerController
{
    [self playerController];
}

- (void)playVideoWithMoviePlayerViewController
{
    [self presentMoviePlayerViewControllerAnimated:self.playerViewController];
}

#pragma mark - Accessors

- (AVPlayer *)player
{
    if (!_player) {
        NSURL *url = [NSURL URLWithString:VideoURLStr];
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        _player = [AVPlayer playerWithPlayerItem:item];
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:_player];
        layer.frame = CGRectMake(0, 20, kScreenWidth, kScreenWidth);
        [self.view.layer addSublayer:layer];
    }
    
    return _player;
}

- (MPMoviePlayerController *)playerController
{
    if (!_playerController) {
        NSURL *url = [NSURL URLWithString:VideoURLStr];
        _playerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
        _playerController.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth);
        _playerController.controlStyle = MPMovieControlStyleNone;
        [self.view addSubview:_playerController.view];
    }
    
    return _playerController;
}

- (MPMoviePlayerViewController *)playerViewController
{
    if (!_playerViewController) {
        NSURL *url = [NSURL URLWithString:VideoURLStr];
        _playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    }
    
    return _playerViewController;
}

@end
