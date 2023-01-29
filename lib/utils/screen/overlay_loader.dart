import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/general/app_loading.dart';

const defaultValue = 56.0;

class Loader extends StatelessWidget {
  static OverlayEntry? _currentLoader;

  Loader._(this._progressIndicator);

  final Widget _progressIndicator;
  // final ThemeData _themeData;

  static OverlayState? _overlayState;

  static void show(BuildContext context,
      {Widget? progressIndicator,
      //  ThemeData? themeData,
      Color? overlayColor,
      double? overlayFromTop,
      double? overlayFromBottom,
      bool isAppbarOverlay = false,
      bool isBottomBarOverlay = true}) async {
    _overlayState = Overlay.of(context);
    if (_currentLoader == null) {
      _currentLoader = await new OverlayEntry(builder: (context) {
        return Stack(
          children: <Widget>[
            Container(
              color: overlayColor ?? Color(0x99ffffff),
              margin: EdgeInsets.only(
                  top: !isAppbarOverlay ? overlayFromTop ?? defaultValue : 0.0,
                  bottom: isBottomBarOverlay
                      ? 0.0
                      : overlayFromBottom ?? defaultValue),
            ),
            Center(
                child: Loader._(
              progressIndicator ?? AppLoading.green(),
              // themeData ??
              //     Theme.of(context).copyWith(accentColor: MyColors.mainGrey),
            )),
          ],
        );
      });
      try {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => _overlayState?.insertAll([_currentLoader!]));
      } catch (e) {}
    }
  }

  static void hide() {
    if (_currentLoader != null) {
      try {
        _currentLoader?.remove();
      } catch (e) {
        print(e.toString());
      } finally {
        _currentLoader = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: AppLoading.green());
  }
}
