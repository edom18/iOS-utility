
#import "EDOUtilities.h"

#import <objc/runtime.h>

// テキストフォーマット（大本）
NSString* EDOFormatVariant(NSString *format, va_list args)
{
#if __has_feature(objc_arc)
    return [[NSString alloc] initWithFormat:format arguments:args];
#else
    return [[[NSString alloc] initWithFormat:format arguments:args] autorelease];
#endif
}

// テキストフォーマット
NSString* EDOFormat(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSString *str = EDOFormatVariant(format, args);
    va_end(args);
    return str;
}

// 対象インスタンスのdescriptionを生成
NSString* EDOLogDescription(id instance)
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([instance class], &count);
    NSMutableString *description = [NSMutableString stringWithString:@"Properties: (\n"];
    for (NSUInteger i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *propName     = property_getName(property);
        const char *propType     = property_getAttributes(property);
        NSString *propertyName   = @(propName);
        NSString *propertyType   = @(propType);
        NSString *propertyString = @"";
        
        SEL selector = NSSelectorFromString(propertyName);
        if ([instance respondsToSelector:selector] && [propertyType hasPrefix:@"T@"]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            propertyString = EDOFormat(@"\t%@: %@ \n", propertyName, [instance performSelector:selector]);
#pragma clang diagnostic pop
        }
        else {
            propertyString = EDOFormat(@"\t%@'s type is primitive (%@)\n", propertyName, propertyType);
        }
        
        [description appendString:propertyString];
    }
    [description appendString:@")"];
    return description;
}