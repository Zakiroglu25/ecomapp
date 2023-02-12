// Dart imports:
// Package imports:

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/text.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/status_dynamic.dart';

class ImagesProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> addPrescription({File? invoice}) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.prescription;

    FormData? data;

    if (invoice == null) {
    } else {
      data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          invoice.path,
          filename: "invoice.png",
        ),
      });
    }

    // await MultipartFile.fromFile(
    //   invoice!.path,
    //   filename: "invoice.png",
    // )
    final response = await dioAuth.dio.post(api, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      statusDynamic.statusCode = response.statusCode;
      bbbb("avatar st code: " + statusDynamic.statusCode.toString());
      bbbb("responseresponse: $response ");
      if (statusDynamic.statusCode.isSuccess) {
        statusDynamic.data = response.data['guid'];
      } else {
        statusDynamic.data = MyText.avatarNotAdded;
      }
    }).catchError((e, s) => Recorder.recordCatchError(e, s));

    return statusDynamic;
  }
}
