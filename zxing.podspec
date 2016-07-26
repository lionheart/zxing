Pod::Spec.new do |s|
  s.name                        = "zxing"
  s.version                     = "2.3.0-fixed"
  s.summary                     = "Multi-format 1D/2D barcode image processing library."
  s.homepage                    = "http://code.google.com/p/zxing/"
  s.author                      = "ZXing team (http://code.google.com/p/zxing/people/list)"
  s.source                      = { :git => "https://github.com/lionheart/zxing.git", :tag => "zxing-2.3.0-fixed" }
  s.requires_arc                = false

# workaround for a missing import in objc/src/ZXing/ZXImage.mm
  s.prefix_header_contents      = <<-EOS
#ifdef __OBJC__
  #import <ImageIO/CGImageSource.h>
#endif
EOS

  s.libraries               = 'stdc++', 'iconv'
  s.frameworks              = 'AddressBook', 'AudioToolbox', 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'Foundation', 'ImageIO', 'QuartzCore'
  s.platform                = :ios, '8.4'

  s.subspec 'core' do |ss|
    ss.source_files            = 'cpp/core/src/zxing/**/*.{hh,h,m,mm,cpp,cc}'
    ss.header_mappings_dir     = 'cpp/core/src/zxing'
  end

  s.subspec 'bigint' do |ss|
    ss.source_files            = 'cpp/core/src/bigint/*.{hh,h,m,mm,cc}'
    ss.header_mappings_dir     = 'cpp/core/src'
  end

  s.subspec 'ios' do |ss|
    ss.source_files            = 'iphone/ZXingWidget/Classes/**/*.{h,m,mm}'
    ss.header_mappings_dir     = 'iphone'
  end

  s.subspec 'main' do |ss|
    ss.dependency 'zxing/ios'
    ss.dependency 'zxing/bigint'
    ss.dependency 'zxing/core'
  end
end

