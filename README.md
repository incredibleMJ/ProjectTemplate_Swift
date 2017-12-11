### 项目结构介绍

代码主要分为四部分，Main , Expand , Vendors , Resource

![项目主体结构](https://wx4.sinaimg.cn/mw690/e5450be8gy1fm4nsdt7iuj209t0adq3y.jpg)
![项目详细结构](https://wx2.sinaimg.cn/mw690/e5450be8gy1fm6d4bppdlj20ap0l5778.jpg)

#### 1. Main 功能模块代码
 
* 每个模块内部按 MVC 组织，其中 Views 文件夹有两个子文件夹, TableCells 专门放 tableViewCell , CollectCells 专门放 collectionViewCell
* Common 模块放一些通用的东西，比如配置 BaseViewController ，通用的 View 等

#### 2. Expand 扩展实用类

这部分主要是一些扩展的基础组件

* Const&Macro 放一些常量和函数， Constant.swift 是常用的常量和函数，比如屏幕宽高等，Theme.swift 用于主题配置，颜色等样色， Config.swift 用于一些全局配置，比如域名等配置
* DataBase 数据库相关
* Extension 扩展都放这里
* Network 网络层(通过 Moya + Alamofire ) 这里按模块配置好相应 SomeModuleAPI.swift 即可
* Tool 工具类,一些常用的工具性质的文件放这里

#### 3. Resource 资源文件

这里主要放一些图片，音频等资源文件

* Images 放图片，建议按模块分文件夹
* 其他资源按需分类新建文件夹

#### 4. Vendors 第三方库或服务

这里放第三方的代码，可以是基础组件，也可以是支付，地图，推送等基础服务等


