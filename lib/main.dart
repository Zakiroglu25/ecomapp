import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/config/init.dart';
import 'package:uikit/infrastructure/cubit/app_bloc_observer.dart';
import 'package:uikit/locator.dart';

import 'infrastructure/services/hive_service.dart';
import 'mate_app.dart';

HiveService get _prefs => locator<HiveService>();

class Adam {
  late final String name;

  // Adam(this.name);

  static final _map = <String, Adam>{};

  //{"Sohrab":Adam("Sohrab")}

  factory Adam() => Adam._internal();

  Adam._internal();

  cap() => print(this.name);
}

Future<dynamic> onBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message['data'] != null) {
    final data = message['data'];
    final title = data['title'];
    final body = data['message'];
  }
}

void main() async {
  // Adam a1 = Adam();
  // Adam a2 = Adam();
  // Adam a3 = Adam();
  // Adam a4 = Adam();
  // Adam a5 = Adam();
  //
  // print("object 1: ${a1.hashCode}");
  // print("object 2: ${a2.hashCode}");
  // print("object 3: ${a3.hashCode}");
  // print("object 4: ${a4.hashCode}");
  // print("object 5: ${a5.hashCode}");
  //
  // final client1 = SohClient2.dio;
  // final client2 = SohClient2.dio;
  // // client.post("path");
  // print("object client1: ${client1.hashCode}");
  // print("object client2: ${client2.hashCode}");
  //
  // final client3 = SohClient2();
  // final client4 = SohClient2();
  // // client.post("path");
  // print("object client3: ${client3.hashCode}");
  // print("object client4: ${client4.hashCode}");
  //

  await init();
  BlocOverrides.runZoned(
    () {
      runApp(const MateApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class SohClient {
  SohClient._();

  static SohClient? _instance;

  static get instance => _instance ??= SohClient._();
}

class SohClient2 {
  SohClient2._();

  static Dio? _dio;

  static Dio get dio {
    return _dio ??= Dio(BaseOptions(baseUrl: "example.com"));
  }

  Dio get dio2 {
    return _dio ??= Dio(BaseOptions(baseUrl: "example.com"));
  }

  static SohClient2? _instance;

  factory SohClient2() {
    return _instance ??= SohClient2._();
  }
}
