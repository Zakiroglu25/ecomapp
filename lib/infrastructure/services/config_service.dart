// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/constants/preferences_keys.dart';

class ConfigService {
  static ConfigService? _instance;
  static Box? _box;

  ConfigService._internal();

  static Future<ConfigService> get instance async {
    _instance ??= ConfigService._internal();
    _box = await Hive.openBox('config');
    return _instance!;
  }

  void clear() async {
    return _box!.close();
  }

  // refresh token
  Future<void> persistOnBoard({bool? seen}) async {
    if (seen == null) {
      await _box!.delete(SharedKeys.onBoardIsSeen);
    } else {
      await _box!.put(SharedKeys.onBoardIsSeen, seen);
    }
  }

  bool get onBoardIsSeen => _box!.get(SharedKeys.onBoardIsSeen) ?? false;

  // email
  Future<void> persistEmail({String? email}) async {
    if (email == null) {
      await _box!.delete(SharedKeys.email);
    } else {
      await _box!.put(SharedKeys.email, email);
    }
  }

  String get email => (_box!.get(SharedKeys.email)) ?? '';
}
