/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

///
/// 本机图片
/// 相机+相册
/// 弹窗ios风格
/// 选照片微信风格
/// ps: 限制只能选一张
///
class ImagePicker extends StatefulWidget {
  //初始显示 比如提示添加 或者是 原有头像
  final Widget child;

  //选择照片回调
  final Function(AssetEntity assetEntity) onPicker;

  //主题颜色
  final Color themeColor;

  //选择颜色
  final ThemeData pickerTheme;

  //可选相机
  final bool allowCamera;

  //可选相册
  final bool allowGallery;

  //高度
  final double height;

  //宽度
  final double width;

  //形状
  final BoxShape shape;

  //圆角
  final BorderRadius borderRadius;

  final BoxFit fit;

  const ImagePicker({
    this.child,
    @required this.onPicker,
    this.themeColor,
    this.pickerTheme,
    this.allowCamera = true,
    this.allowGallery = true,
    this.height = 100,
    this.width = 100,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.fit = BoxFit.cover,
  });

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  //已选图片
  AssetEntity _selectedAsset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _selectedAsset == null
          ? Container(
              width: widget.width,
              height: widget.height,
              child: Center(child: widget.child ?? Icon(Icons.add)))
          : GleamImage(
              image: _selectedAsset,
              shape: widget.shape,
              borderRadius: widget.borderRadius,
              width: widget.width,
              height: widget.height,
              isOriginal: false,
              fit: widget.fit,
            ),
      onTap: widget.onPicker == null ? null : () => _pickerImage(context),
    );
  }

  _pickerImage(BuildContext context) async {
    var i = await showImagePickerPopup(context,
        allowCamera: widget.allowCamera, allowGallery: widget.allowGallery);
    AssetEntity image;
    if (i == 1) {
      image = await CameraPicker.pickFromCamera(context,
          resolutionPreset: ResolutionPreset.high);
      if (image == null) return;
    } else if (i == 2) {
      final List<AssetEntity> assets = await AssetPicker.pickAssets(
        context,
        maxAssets: 1,
        themeColor: widget.themeColor,
        pickerTheme: widget.pickerTheme,
        requestType: RequestType.image,
        selectedAssets: _selectedAsset == null ? [] : [_selectedAsset],
      );
      if (assets == null) return;
      image = assets.isNotEmpty ? assets.first : null;
    }
    if (widget.onPicker != null) widget.onPicker(image);
    setState(() {
      _selectedAsset = image;
    });
  }

  Future<int> showImagePickerPopup(BuildContext context,
      {bool allowCamera = true, bool allowGallery = true}) async {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text("选择照片"),
            cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context, 0), child: Text("取消")),
            actions: <Widget>[
              if (allowCamera)
                CupertinoActionSheetAction(
                    onPressed: () => Navigator.pop(context, 1),
                    child: Text("拍摄")),
              if (allowGallery)
                CupertinoActionSheetAction(
                    onPressed: () => Navigator.pop(context, 2),
                    child: Text("从手机相册选择")),
            ],
          );
        });
  }
}
