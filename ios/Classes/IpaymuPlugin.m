#import "IpaymuPlugin.h"
#if __has_include(<ipaymu/ipaymu-Swift.h>)
#import <ipaymu/ipaymu-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ipaymu-Swift.h"
#endif

@implementation IpaymuPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIpaymuPlugin registerWithRegistrar:registrar];
}
@end
