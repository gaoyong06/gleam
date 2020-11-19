|      |      |
| ---- | ---- |
|  作者    |  [gaoyong](mailto:gaoyong06@qq.com) |
|  创建时间    | 2020-11-04 13:40:00      |
# gleam

一个简单、轻量、可靠的Flutter UI 组件库

## 介绍

在业务开发中经常会有一些常用的组件，将这些常用的组件标准化后，有了这个库

希望gleam是一个简单、轻量、可靠的Flutter UI 组件库

## 安装

1. 在项目的pubspec.yaml中在增加下面配置：gleam: ^1.0.0
2. 第二步：然后在项目根目录(pubspec.yaml 所在的目录)执行命令：flutter pub get

## 介绍

##### BottomSheet 底部菜单弹窗

​	底部弹出的菜单

###### 示意图
<img src="https://github.com/gaoyong06/gleam/blob/master/doc/1604912567034167.gif" style="zoom: 40%;"/>


|  <img src="https://ww1.sinaimg.cn/mw690/00019562gy1gkj1gbkf8kj20u01t0tbu.jpg" style="zoom:40%"/>    | <img src="https://ww1.sinaimg.cn/mw690/00019562gy1gkj1gq2kx0j20u01t077m.jpg" style="zoom:40%"/>     |   <img src="https://ww1.sinaimg.cn/mw690/00019562gy1gkj1h1fc9jj20u01t0424.jpg" style="zoom:40%"/>   |   <img src="https://ww1.sinaimg.cn/mw690/00019562gy1gkj1h9l63pj20u01t0tce.jpg" style="zoom:40%"/>   |   <img src="https://ww1.sinaimg.cn/mw690/00019562gy1gkj1hrawwyj20u01t0q61.jpg" style="zoom:40%"/>   |
| ---- | ---- | ---- | ---- | ---- |
|  基础用法    |   展示取消按钮   |   展示描述信息   |  选项状态    |  自定义面板   |


调用showGleamBottomSheet函数后弹出的底部菜单弹窗，其中操作项使用**BottomSheetAction**组件

###### 	参数说明

| 参数名称      | 说明                                                         | 类型               | 默认值 |
| ------------- | ------------------------------------------------------------ | ------------------ | ------ |
| context       | 上下文                                                       | BuildContext       | -      |
| actions       | 操作项列表                                                   | List<Widget>       | -      |
| contentWidget | 内容区域Widget (如果设置contentWidget，则actions、description、cancelText、onCancelTap的设置不生效) | Widget             | -      |
| description   | 顶部显示的描述(可以是文字或者Widget)                         | dynamic            | -      |
| cancelText    | 取消文案（没有设置则不显示“取消”按钮）                       | String             | -      |
| onCancelTap   | 取消按钮点击回调方法                                         | GestureTapCallback | -      |

**BottomSheetAction**组件属性说明

| 属性名称      | 说明                         | 类型               | 默认值 |
| ------------- | ---------------------------- | ------------------ | ------ |
| item          | 操作项(可以是文字或者Widget) | dynamic            | -      |
| height        | 操作项高度                   | double             | 50     |
| onTap         | 操作项点击回调方法           | GestureTapCallback | -      |
| hiddenDivider | 是否隐藏操作项下方分割线     | bool               | false  |

###### 	代码演示

```dart
//基础用法
showGleamBottomSheet(context, actions: [
  BottomSheetAction('选项一', onTap: () {
    showToast('选项一');
  }),
  BottomSheetAction('选项二', hiddenDivider: true, onTap: () {
    showToast('选项二');
  }),
]);

//展示取消按钮
showGleamBottomSheet(
  context,
  actions: [
    BottomSheetAction('选项一', onTap: () {
      showToast('选项一');
    }),
    BottomSheetAction(
      '选项二',
      hiddenDivider: true,
      onTap: () {
        showToast('选项二');
      },
    ),
  ],
  cancelText: '取消',
  onCancelTap: () {
    showToast('取消');
  },
);

//展示描述信息
showGleamBottomSheet(
  context,
  actions: [
    BottomSheetAction('选项一', onTap: () {
      showToast('选项一');
    }),
    BottomSheetAction(
      '选项二',
      hiddenDivider: true,
      onTap: () {
        showToast('选项二');
      },
    ),
  ],
  description: Container(
    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
    height: 60.0,
    child: Text(
      '这是描述信息',
      style: Style.ts_999999_15,
    ),
  ),
  cancelText: '取消',
  onCancelTap: () {
    showToast('取消');
  },
);

//选项状态
showGleamBottomSheet(
  context,
  actions: [
    BottomSheetAction(
      Text(
        '着色选项',
        style: Style.ts_FF0000_15,
      ), onTap: () {
        showToast('着色状态');
      }),
    BottomSheetAction(
      Text(
        '禁用选项',
        style: Style.ts_999999_15,
      ),
      onTap: null,
    ),
    BottomSheetAction(
      CupertinoActivityIndicator(),
      hiddenDivider: true,
      onTap: () {
        showToast('loading...');
      },
    ),
  ],
  cancelText: '取消',
  onCancelTap: () {
    showToast('取消');
  },
);

//自定义面板
showGleamBottomSheet(
  context,
  contentWidget: Container(
    height: 200.0,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.close),
            color: AppColors.clC8C9CC,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "标题",
                  style: Style.ts_333333_15_bold,
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Text('内容'),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
              );
```




##### Dialog 弹出框

​	弹出模态框，常用于消息提示、消息确认、在当前页面内完成特定的交互操作

##### Empty 空状态

​	空状态时的占位提示

##### FilledButton 填充按钮

​	填充按钮的文字为白色，背景为按钮的颜色

##### GleamOutlineButton 细边框按钮

​	细边框按钮的文字,和边框为按钮的颜色，背景为白色

##### GleamTextButton 文字按钮

​	文字按钮只有一个文字，该文字可以点击

##### GleamTextField 文本输入框

​	提供文本输入框右侧尾随的Widget扩展

##### GleamIcon 图标

​	提供Icon及Icon上红点及消息未读数显示

##### GleamImage 图片

​	提供多种图片来源网络图片、本地图片、资源图片，支持圆角、支持占位图、失败图

##### ImagePicker 照片选择

​	从手机相册选择照片

##### Placeholder 占位状态

​	占位状态时的组件	

##### Search 搜索

​	搜索输入框

##### ShareSheet 分享面板

​	底部弹起的分享面板，用于展示各分享渠道对应的操作按钮，不含具体的分享逻辑。

##### Tag 标签

​	文字，或者图标+

## 依赖


## 团队成员
  - [@gaoyong](https://github.com/gaoyong06)
  - [@liuxiaobina](https://github.com/liuxiaobina)
  - [@lee980](https://github.com/lee980)

  











