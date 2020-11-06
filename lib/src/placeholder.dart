/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/material.dart';
import 'package:gleam/r.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/dimens.dart';

///占位图Widegt
class Placeholder extends StatelessWidget {
  final String assetName;
  final void Function() onPressed;

  const Placeholder({Key key, this.assetName, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.radiusDp5)),
        image: DecorationImage(
            image: AssetImage(R.assetsImagesBgPlaceholder), fit: BoxFit.cover),
      ),
      child: FlatButton(
        highlightColor: AppColors.cl19000000,
        splashColor: Colors.transparent,
        color: Colors.transparent,
        textColor: Colors.white,
        child: null,
        onPressed: onPressed,
      ),
    );
  }
}
