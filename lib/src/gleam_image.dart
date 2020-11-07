/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'dart:io';
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

///
/// 图片展示
/// 支持 网络图片 本地图片 资源图片
/// 支持 形状 圆角等配置
/// 支持 占位图 失败图
///
class GleamImage extends StatelessWidget {
  //图片对象,支持 网络+本地+资源图
  final dynamic image;

  //宽高,如果只传一个,就是正方形
  final double width, height;

  //图片展示方式
  final BoxFit fit;

  //失败图
  final Widget errorWidget;

  //占位图
  final Widget placeholderWidget;

  //形状
  final BoxShape shape;

  //圆角
  final BorderRadius borderRadius;

  //是否显示原图，只对AssetEntity有效，配置false可显示缩略图更快
  final bool isOriginal;

  //ExtendedImage中属性
  final ExtendedImageMode mode;
  final InitGestureConfigHandler initGestureConfigHandler;
  final DoubleTap onDoubleTap;
  final bool enableSlideOutPage;
  final HeroBuilderForSlidingPage heroBuilderForSlidingPage;
  final Alignment alignment;
  final BoxBorder border;
  final Color color;

  const GleamImage({
    Key key,
    @required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.placeholderWidget,
    this.errorWidget = const Icon(Icons.error),
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.border,
    this.alignment = Alignment.center,
    this.isOriginal = true,
    this.mode = ExtendedImageMode.none,
    this.initGestureConfigHandler,
    this.onDoubleTap,
    this.enableSlideOutPage = false,
    this.heroBuilderForSlidingPage,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget gleamImage = buildGleamImage();
    if (shape == BoxShape.circle) {
      gleamImage = ClipOval(child: gleamImage);
    } else if (borderRadius != null) {
      gleamImage = ClipRRect(child: gleamImage, borderRadius: borderRadius);
    }
    return gleamImage;
  }

  Widget buildGleamImage() {
    if (image == null) {
      return errorWidget;
    }
    //宽高一样，可以只传一个
    var height = this.height ?? this.width;
    var width = this.width ?? this.height;

    ImageProvider imageProvider;
    if (image is String && image.startsWith("http")) {
      imageProvider =
          ExtendedNetworkImageProvider(image, cache: true, scale: 1.0);
    } else if (image is AssetEntity) {
      imageProvider = AssetEntityImageProvider(image, isOriginal: isOriginal);
    } else if (image is File) {
      print("#### FileImage #####");
      imageProvider = FileImage(image);
    } else if (image is Uint8List) {
      imageProvider = MemoryImage(image);
    } else {
      print("#### AssetImage #####");
      imageProvider = AssetImage(image, bundle: null, package: 'gleam');
    }

    return ExtendedImage(
      fit: fit,
      shape: shape,
      width: width,
      height: height,
      mode: this.mode,
      border: border,
      color: color,
      image: imageProvider,
      alignment: alignment,
      enableMemoryCache: true,
      onDoubleTap: onDoubleTap,
      borderRadius: borderRadius,
      enableSlideOutPage: enableSlideOutPage,
      initGestureConfigHandler: initGestureConfigHandler,
      heroBuilderForSlidingPage: heroBuilderForSlidingPage,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            if (imageProvider is AssetImage) {
              return null;
            }
            if (imageProvider is AssetEntityImageProvider) {
              return _buildThumb(); //加载缩略图
            }
            return placeholderWidget ??
                Center(child: CupertinoActivityIndicator());
          case LoadState.failed:
            return errorWidget;
          default:
            return null;
        }
      },
    );
  }

  _buildThumb() {
    return ExtendedImage(
      fit: fit,
      shape: shape,
      width: width,
      height: height,
      border: border,
      borderRadius: borderRadius,
      image: AssetEntityImageProvider(image, isOriginal: false),
    );
  }
}
