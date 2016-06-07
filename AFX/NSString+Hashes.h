//
//  NSString+Hashes.h
//  AFX
//
//  Created by Leon Cao on 2014-11-29.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#ifndef AFX_NSString_Hashes_h
#define AFX_NSString_Hashes_h


#endif
// From Outside Source:
// https://github.com/hypercrypt/NSString-Hashes/blob/master/NSString%2BHashes.h
//
//  NSString+Hashes.h
//
//  Created by Klaus-Peter Dudas on 26/07/2011.
//  Copyright: Do whatever you want with this, i.e. Public Domain
//

#import <Foundation/Foundation.h>

@interface NSString (Hashes)

@property (nonatomic, readonly) NSString *md5;
@property (nonatomic, readonly) NSString *sha1;
@property (nonatomic, readonly) NSString *sha224;
@property (nonatomic, readonly) NSString *sha256;
@property (nonatomic, readonly) NSString *sha384;
@property (nonatomic, readonly) NSString *sha512;

@end