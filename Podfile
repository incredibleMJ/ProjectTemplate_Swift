# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'
 inhibit_all_warnings!

target 'ProjectTemplate_Swift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProjectTemplate_Swift
  pod 'Moya', '~> 9.0' #网络抽象层
  pod 'Alamofire', '~> 4.5' #网络请求库
  pod 'HandyJSON', '~> 4.2.1' #JSON转模型
  pod 'MJRefresh' #下拉刷新
  pod 'MBProgressHUD', '~> 1.1.0' #弹框提示
  pod 'SnapKit', '~> 4.0.0' #布局库
  pod 'Kingfisher', '~> 4.0' #网络图片加载
  pod 'CryptoSwift' #加解密
  pod 'DZNEmptyDataSet' #空列表显示
  pod 'RealmSwift' #数据库
  pod 'Bugly' #崩溃日志
  pod 'FCUUID' #设备唯一标识

  target 'ProjectTemplate_SwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ProjectTemplate_SwiftUITests' do
    inherit! :search_paths
    
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end
