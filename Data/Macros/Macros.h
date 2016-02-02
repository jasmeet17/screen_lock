//
//  Macros.h
//  Cards Lock
//
//  Created by Abhi on 15/04/15.
//  Copyright (c) 2015 Abhi. All rights reserved.
//

#ifndef Cards_Lock_Macros_h
#define Cards_Lock_Macros_h

// Push / Pop
#define PUSH(VC)                [self.navigationController pushViewController:VC animated:YES]
#define POP(animated)           [self.navigationController popViewControllerAnimated:animated]
#define DISMISS(animated)       [self dismissViewControllerAnimated:animated completion:nil];

// Images PlaceHolders
#define USER_IMAGE_PLACEHOLDER  [UIImage imageNamed:@"user_placeholder.jpg"]
#define IMAGE_PLACEHOLDER       [UIImage imageNamed:@"cPlaceholder.png"]

// STORYBOARD
#define STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]

// SCREEN SIZE
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

#endif
