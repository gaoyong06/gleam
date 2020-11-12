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
import 'package:gleam_example/pages/empty_page.dart';
import 'package:gleam_example/pages/filled_button_page.dart';
import 'package:gleam_example/pages/gleam_dialog_page.dart';
import 'package:gleam_example/pages/gleam_icon_page.dart';
import 'package:gleam_example/pages/gleam_image_page.dart';
import 'package:gleam_example/pages/gleam_outline_button_page.dart';
import 'package:gleam_example/pages/gleam_text_button_page.dart';
import 'package:gleam_example/pages/gleam_text_field_page.dart';
import 'package:gleam_example/pages/image_picker_page.dart';
import 'package:gleam_example/pages/placeholder_page.dart';
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
  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context,
        designSize: Size(750 / 2, 1334 / 2), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Style.ts_FFFFFF_18_bold,
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
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
          SizedBox(
            height: 30.0,
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'BottomSheet 底部菜单弹窗',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => BottomSheetPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamDialog 弹出框',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => GleamDialogPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Empty 空状态',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => EmptyPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'FilledButton 填充按钮',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => FilledButtonPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamOutlineButton 细边框按钮',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => GleamOutlineButtonPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamTextButton 文字按钮',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => GleamTextButtonPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamTextField 文本输入框',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => GleamTextFieldPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamIcon 图标',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => GleamIconPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'GleamImage 图片',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => GleamImagePage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'ImagePicker 照片选择',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => ImagePickerPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Placeholder 占位状态',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => PlaceholderPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Search 搜索',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'ShareSheet 分享面板',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => ShareSheetPage()),
              );
            },
          ),
          GleamOutlineButton(
            margin: EdgeInsets.only(top: 10.0),
            text: 'Tag 标签',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => TagPage()),
              );
            },
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
