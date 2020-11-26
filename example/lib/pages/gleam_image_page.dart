/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';

/// GleamImagePage图片示例程序
class GleamImagePage extends StatefulWidget {
  GleamImagePage({Key key}) : super(key: key);

  @override
  _GleamImagePageState createState() => _GleamImagePageState();
}

class _GleamImagePageState extends State<GleamImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GleamImage 图片",
          style: Style.bold18ColorFFFFFF,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Text(
              "基础用法",
              style: Style.normal14Color66455A64,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GleamImage(
                  image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                  width: 80.0,
                  height: 80.0,
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "填充模式",
              style: Style.normal14Color66455A64,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.contain,
                  ),
                  text: "contain",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  text: "cover",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.fill,
                  ),
                  text: "fill",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.none,
                  ),
                  text: "none",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.scaleDown,
                  ),
                  text: "scaleDown",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "圆形图片",
              style: Style.normal14Color66455A64,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    shape: BoxShape.circle,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.contain,
                  ),
                  text: "contain",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    shape: BoxShape.circle,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  text: "cover",
                ),
                SizedBox(
                  width: 16.0,
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    shape: BoxShape.circle,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.fill,
                  ),
                  text: "fill",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    shape: BoxShape.circle,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.none,
                  ),
                  text: "none",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'https://img.yzcdn.cn/vant/cat.jpeg',
                    shape: BoxShape.circle,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.scaleDown,
                  ),
                  text: "scaleDown",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "加载中提示",
              style: Style.normal14Color66455A64,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'http://weibo.com/',
                    width: 80.0,
                    height: 80.0,
                    //下面的errorWidget设置和placeholderWidget设置相同
                    //只是为了演示效果，否则placeholderWidget会一闪而过
                    errorWidget: Container(
                      color: AppColors.clF7F8FA,
                      child: GleamIcon(
                        Icons.image,
                        size: 32.0,
                        color: AppColors.clDCDEE0,
                      ),
                    ),
                  ),
                  text: "默认提示",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'http://weibo.com/',
                    width: 80.0,
                    height: 80.0,
                    placeholderWidget: Container(
                      color: AppColors.clF7F8FA,
                      child: Center(child: CupertinoActivityIndicator()),
                    ),
                    //下面的errorWidget设置和placeholderWidget设置相同
                    //只是为了演示效果，否则placeholderWidget会一闪而过
                    errorWidget: Container(
                      color: AppColors.clF7F8FA,
                      child: Center(child: CupertinoActivityIndicator()),
                    ),
                  ),
                  text: "自定义提示",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "加载失败提示",
              style: Style.normal14Color66455A64,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'http://weibo.com/',
                    width: 80.0,
                    height: 80.0,
                  ),
                  text: "默认提示",
                ),
                SizedBox(
                  width: 16.0,
                ),
                VerticalItemWidget(
                  gleamImage: GleamImage(
                    image: 'http://weibo.com/',
                    width: 80.0,
                    height: 80.0,
                    errorWidget: Container(
                      color: AppColors.clF7F8FA,
                      child: Center(
                          child: Text(
                        "加载失败",
                        style: Style.normal14Color969799,
                      )),
                    ),
                  ),
                  text: "自定义提示",
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}

///自定义垂直子Widget
class VerticalItemWidget extends StatelessWidget {
  final GleamImage gleamImage;
  final String text;

  const VerticalItemWidget({Key key, this.gleamImage, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gleamImage,
        SizedBox(
          height: 6.0,
        ),
        Text(
          text ?? "",
          style: Style.normal14Color646566,
        )
      ],
    );
  }
}
