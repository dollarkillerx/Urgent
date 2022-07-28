import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
// https://www.liujunmin.com/flutter/io/path_provider.html 临时文件

class Img {
  /// 获取临时目录文件
  static Future<File?> _getLocalTemporaryFile(String filename) async {
    final dir = await getTemporaryDirectory();

    var l = filename.split(".");
    if (l.isEmpty) {
      return null;
    }
    var uuid = Uuid().v4().toString();

    var filen = '${uuid}.${l[l.length-1]}';

    return File('${dir.path}/${filen}');
  }

  static Future<File?> compressAndGetFile(File file) async {
    print(file.absolute.path);
    var at =await file.lengthSync();
    print("p: ${at}");

    var fi = await _getLocalTemporaryFile(file.path);

    if (fi == null) {
      return null;
    }
    print(fi.absolute.path);
    
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, fi.absolute.path,
      // minWidth: 2300,
      // minHeight: 1500,
      quality: 50,
    );

    var bt =await result?.lengthSync();
    print("out: ${bt}");


    return result;
  }
}