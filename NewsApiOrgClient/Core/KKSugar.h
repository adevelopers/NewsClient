//
//  KKSugar.h
//  ChineseHieroglyphs
//
//  Created by Kirill Khudiakov on 26/02/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#ifndef KKSugar_h
#define KKSugar_h

#define let __auto_type const
#define var __auto_type

@interface NSArray<__covariant ObjectType> (ForeachSupport)

@property (nonatomic, strong, readonly) ObjectType jm_enumeratedType;

@end

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (ForeachSupport)

@property (nonatomic, strong, readonly) KeyType jm_enumeratedType;

@end

#define foreach(object_, collection_) \
for (typeof((collection_).jm_enumeratedType) object_ in (collection_))

#endif /* KKSugar_h */
