/* 
* created by 1129502088@qq.com
* Date 2020/11/25 11:27
*/
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';

class GleamCheckBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GleamCheckBox")),
      body: Column(
        children: [
          GleamCheckBox()
        ],
      ),
    );
  }
}
