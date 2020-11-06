/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-02-16 16:42:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-02-18 14:56:30
 */

//【重要】flutter中默认组件尺寸单位都是dp
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  //字体大小
  //大标题
  static  double fontPt24 = ScreenUtil().setSp(24);
  static  double fontPt20 = ScreenUtil().setSp(20);
  static  double fontPt18 = ScreenUtil().setSp(18);
  //导航栏
  static  double fontPt16 = ScreenUtil().setSp(16);
  //小标题,列表文字
  static  double fontPt15 = ScreenUtil().setSp(15);
  //小标题
  static  double fontPt14 = ScreenUtil().setSp(14);
  static  double fontPt13 = ScreenUtil().setSp(13);
  static  double fontPt12 = ScreenUtil().setSp(12);
  static  double fontPt11 = ScreenUtil().setSp(11);
  //数字
  static  double fontPt10 = ScreenUtil().setSp(10);

  //圆角大小
  //头像
  static const double radiusDp60 = 60.0;

  static const double radiusDp40 = 40.0;

  static const double radiusDp30 = 30.0;
  static const double radiusDp20 = 20.0;
  //大按钮
  static const double radiusDp25 = 25.0;
  //小按钮
  static const double radiusDp5 = 5.0;
  //底部弹层, 弹窗
  static const double radiusDp10 = 10.0;

  //间距大小
  static const double gapDp84 = 84.0;
  static const double gapDp30 = 30.0;
  static const double gapDp20 = 20.0;
  static const double gapDp10 = 10.0;

  //阴影
  static const double shadowDp0 = 0;
  static const double shadowDp5 = 5.0;

  //【未处理】文字间距
  static const double spaceDp_042 = -0.42;
  static const double spaceDp_031 = -0.31;
  static const double spaceDp_026 = -0.26;
  static const double spaceDp_023 = -0.23;
  static const double spaceDp_03 = -0.3;
  static const double spaceDp005 = 0.05;
  static const double spaceDp004 = 0.04;
  static const double spaceDp011 = 0.11;

  //【未处理】行间距

  //【未处理】高度
  static const double heightDp26 = 26.0;

  //【未处理】宽度
  static const double width1Dp50 = 150.0;
}
