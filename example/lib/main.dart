/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';
import 'package:gleam_example/pages/bottom_sheet_page.dart';
import 'package:gleam_example/pages/cell_page.dart';
import 'package:gleam_example/pages/empty_page.dart';
import 'package:gleam_example/pages/gleam_button_page.dart';
import 'package:gleam_example/pages/gleam_dialog_page.dart';
import 'package:gleam_example/pages/gleam_icon_page.dart';
import 'package:gleam_example/pages/gleam_image_page.dart';
import 'package:gleam_example/pages/gleam_text_field_page.dart';
import 'package:gleam_example/pages/layout_page.dart';
import 'package:gleam_example/pages/search_page.dart';
import 'package:gleam_example/pages/share_sheet_page.dart';
import 'package:gleam_example/pages/tag_page.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //去掉Flutter右上角的debug
        title: 'gleam example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'gleam example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //标题样式
  TextStyle textStyle = TextStyle(
    color: Color(0XFF323233),
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

  //标题
  Widget _title(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 24.0, 0, 8),
      child: Text(text ?? '', style: Style.normal14Color66455A64),
    );
  }

  //按钮
  Widget _gleamButton(String text, [Function() onPressed]) {
    Widget _content = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0XFF323233),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 18.0,
          color: Color(0XFFB6C3D2),
        )
      ],
    );

    return GleamButton(
      style: GleamButtonStyle.flatButton,
      type: ButtonType.defaulted,
      margin: EdgeInsets.only(top: 10.0),
      content: _content,
      borderRadius: 99.0,
      fillColor: Color(0XFFF7F8FA),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context,
        designSize: Size(750 / 2, 1334 / 2), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Style.bold18ColorFFFFFF,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: [
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              GleamImage(
                  image:
                      'https://tvax2.sinaimg.cn/crop.0.0.1079.1079.1024/00019562ly1gkffsfazmwj20u00tz0uf.jpg?KID=imgbed,tva&Expires=1604654948&ssig=66QSdllaXt',
                  width: 60,
                  height: 60,
                  shape: BoxShape.circle),
              SizedBox(
                width: 16.0,
              ),
              Text(
                'gleam',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            '一个简单、轻量、可靠的Flutter UI 组件库',
            style: Style.normal14Color66455A64,
          ),
          SizedBox(
            height: 16.0,
          ),
          _title('基础组件'),
          _gleamButton(
            'GleamButton 按钮',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GleamButtonPage()),
              );
            },
          ),
          _gleamButton(
            'Cell 单元格',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CellPage()),
              );
            },
          ),
          _gleamButton(
            'GleamIcon 图标',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GleamIconPage()),
              );
            },
          ),
          _gleamButton(
            'GleamImage 图片',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GleamImagePage()),
              );
            },
          ),
          _gleamButton(
            'Layout 布局#',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayoutPage()),
              );
            },
          ),
          _gleamButton(
            'Popup弹出层#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Style 内置样式#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Toast 轻提示#',
            () {
              showToast("未完成");
            },
          ),
          _title('表单组件'),
          _gleamButton(
            'Calendar 日历#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Checkbox 复选框#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'DatetimePicker 时间选择#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'GleamTextField 输入框#',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GleamTextFieldPage()),
              );
            },
          ),
          _gleamButton(
            'Form 表单#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Numberkeyboard 数字键盘#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'PasswordInput 密码输入框#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Picker 选择器#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Radio 单选框#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Rate 评分#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Search 搜索',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          _gleamButton(
            'Slider 滑块#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Stepper 步进器#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Switch 开关#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Uploader 文件上传#',
            () {
              showToast("未完成");
            },
          ),
          _title('反馈组件'),
          _gleamButton(
            'BottomSheet 底部菜单弹窗',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomSheetPage()),
              );
            },
          ),
          _gleamButton(
            'GleamDialog 弹出框',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GleamDialogPage()),
              );
            },
          ),
          _gleamButton(
            'DropdownMenu 下拉菜单#',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GleamDialogPage()),
              );
            },
          ),
          _gleamButton(
            'Loading 加载#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Notify 消息通知#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Overlay 遮罩层#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'PullRefresh 下拉刷新#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'ShareSheet 分享面板#',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShareSheetPage()),
              );
            },
          ),
          _gleamButton(
            'SwipeCell 滑动单元格#',
            () {
              showToast("未完成");
            },
          ),
          _title('展示组件'),
          _gleamButton(
            'Badge 微标#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Circle 环形进度条#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Collapse 折叠面板#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'CountDown 倒计时#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Divider 分割线#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Empty 空状态',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmptyPage()),
              );
            },
          ),
          _gleamButton(
            'ImagePreview 图片预览#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Lazyload 懒加载#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'List 列表#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'NoticeBar 通知栏#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Popover 气泡弹出窗#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Progress 进度条#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Skeleton 骨架屏#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Steps 步骤条#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Sticky 粘性布局#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Swipe 轮播#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Tag 标签',
            () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => TagPage()),
              );
            },
          ),
          _title('导航组件'),
          _gleamButton(
            'Grid 宫格#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'IndexBar 索引栏#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'NavBar 导航栏#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Pagination 分页#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Sidebar 侧边导航#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Tab 标签页#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'Tabbar 标签栏#',
            () {
              showToast("未完成");
            },
          ),
          _gleamButton(
            'TreeSelect 分类选择#',
            () {
              showToast("未完成");
            },
          ),
          _title('其他'),
          _gleamButton(
            '联系作者#',
            () {
              showToast("未完成");
            },
          ),
          SizedBox(
            height: 40.0,
          ),
          Column(
            children: [
              Text(
                'Made With ❤️ by gaoyong',
                style: Style.normal12Color455A64,
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'Version 1.0.0',
                style: Style.normal12Color455A64,
              ),
              SizedBox(
                height: 4.0,
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
