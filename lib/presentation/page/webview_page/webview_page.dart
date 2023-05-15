//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CaspaAppbar(
//         user: false,
//         title: MyText.makePayment,
//       ),
//       body: WebView(
//         initialUrl: url,
//       ),
//     );
//   }
// }

import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';

import '../../../utils/delegate/index.dart';

class WebviewPage extends StatefulWidget {
  String url;
  Function? whenSuccess;
  Function? whenUnSuccess;
  BuildContext mainContext;
  WebviewPage(
      {Key? key,
      required this.url,
      required this.mainContext,
      required this.whenUnSuccess,
      required this.whenSuccess})
      : super(key: key);
  @override
  _WebviewPageState createState() => new _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final GlobalKey webViewKey = GlobalKey();

  late InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;

//ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // contextMenu = ContextMenu(
    //     menuItems: [
    //       ContextMenuItem(
    //           androidId: 1,
    //           iosId: "1",
    //           title: "Special",
    //           action: () async {
    //             print("Menu item Special clicked!");
    //             print(await webViewController?.getSelectedText());
    //             await webViewController?.clearFocus();
    //           })
    //     ],
    //     options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
    //     onCreateContextMenu: (hitTestResult) async {
    //       print("onCreateContextMenu");
    //       print(hitTestResult.extra);
    //       print(await webViewController?.getSelectedText());
    //     },
    //     onHideContextMenu: () {
    //       print("onHideContextMenu");
    //     },
    //     onContextMenuActionItemClicked: (contextMenuItemClicked) async {
    //       var id = (Platform.isAndroid)
    //           ? contextMenuItemClicked.androidId
    //           : contextMenuItemClicked.iosId;
    //       print("onContextMenuActionItemClicked: " +
    //           id.toString() +
    //           " " +
    //           contextMenuItemClicked.title);
    //     });

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController.reload();
        } else if (Platform.isIOS) {
          webViewController.loadUrl(
              urlRequest: URLRequest(url: await webViewController.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    // webViewController.clo
    super.dispose();
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      print("onwill goback");
      webViewController.goBack();
      return Future.value(true);
    } else {
      // Scaffold.of(context).showSnackBar(
      //   const SnackBar(content: Text("No back history item")),
      // );
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(title: MyText.payment, user: false,notification: false,),
      // title: MyText.payment,
      // notification: false,
      // showAppbarLittleText: true,
      // user: false,
      body: WillPopScope(
        onWillPop: () => _exitApp(context),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: InAppWebView(
            key: webViewKey,
            // contextMenu: contextMenu,

              initialUrlRequest: URLRequest(url: Uri.parse('https://stackoverflow.com/questions/65887263/flutter-center-widget-in-customscrollview'))
            ,// initialFile: "assets/index.html",
            initialUserScripts: UnmodifiableListView<UserScript>([]),
            initialOptions: options,
            pullToRefreshController: pullToRefreshController,
            onWebViewCreated: (controller) {
              webViewController = controller;
            },

            onLoadStart: (controller, url) {
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            androidOnPermissionRequest: (controller, origin, resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url;
              bbbb("url:  $uri");
              // if (![
              //   "http",
              //   "https",
              //   "file",
              //   "chrome",
              //   "data",
              //   "javascript",
              //   "about"
              // ].contains(uri!.scheme)) {
              //   if (await canLaunch(url)) {
              //     // Launch the App
              //     await launch(
              //       url,
              //     );
              //     // and cancel the request
              //     return NavigationActionPolicy.CANCEL;
              //   }
              // }
              if (('$uri').contains('doctoro-dev.ml/public/a2p3r4v5p6m7n8t')) {
                eeee("url containe");
                widget.whenSuccess?.call();
              }

              if (('$uri').contains('orderDecline')) {
                widget.whenUnSuccess?.call();
              }
              if (('$uri').contains('orderCancel')) {
                widget.whenUnSuccess?.call();
              }

              return NavigationActionPolicy.ALLOW;
            },
            onLoadStop: (controller, url) async {
              pullToRefreshController.endRefreshing();
              //setState(() {
              this.url = url.toString();
              urlController.text = this.url;
              //});
            },
            onLoadError: (controller, url, code, message) {
              print("-- mmessage: " + message.toUpperCase());
              //launch("https://caspa.az");
              // pullToRefreshController.endRefreshing();
            },
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                pullToRefreshController.endRefreshing();
              }
              setState(() {
                this.progress = progress / 100;
                urlController.text = this.url;
              });
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            onConsoleMessage: (controller, consoleMessage) {
              print(consoleMessage);
            },
          ),
        ),
      ),
    );
  }
}

// class MyChromeSafariBrowser extends ChromeSafariBrowser {
//   @override
//   void onOpened() {
//     print("ChromeSafari browser opened");
//   }
//
//   @override
//   void onCompletedInitialLoad() {
//     print("ChromeSafari browser initial load completed");
//   }
//
//   @override
//   void onClosed() {
//     print("ChromeSafari browser closed");
//   }
// }

// class ChromeSafariBrowserExampleScreen extends StatefulWidget {
//   final ChromeSafariBrowser browser = MyChromeSafariBrowser();
//
//   @override
//   _ChromeSafariBrowserExampleScreenState createState() =>
//       _ChromeSafariBrowserExampleScreenState();
// }
//
// class _ChromeSafariBrowserExampleScreenState
//     extends State<ChromeSafariBrowserExampleScreen> {
//   @override
//   void initState() {
//     widgets.browser.addMenuItem(ChromeSafariBrowserMenuItem(
//         id: 1,
//         label: 'Custom item menu 1',
//         action: (url, title) {
//           print('Custom item menu 1 clicked!');
//           print(url);
//           print(title);
//         }));
//     widgets.browser.addMenuItem(ChromeSafariBrowserMenuItem(
//         id: 2,
//         label: 'Custom item menu 2',
//         action: (url, title) {
//           print('Custom item menu 2 clicked!');
//           print(url);
//           print(title);
//         }));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text(
//           "ChromeSafariBrowser",
//         )),
//         //drawer: myDrawer(context: context),
//         body: Center(
//           child: ElevatedButton(
//               onPressed: () async {
//                 await widgets.browser.open(
//                     url: Uri.parse("https://flutter.dev/"),
//                     options: ChromeSafariBrowserClassOptions(
//                         android: AndroidChromeCustomTabsOptions(
//                             addDefaultShareMenuItem: false,
//                             keepAliveEnabled: true),
//                         ios: IOSSafariOptions(
//                             dismissButtonStyle:
//                                 IOSSafariDismissButtonStyle.CLOSE,
//                             presentationStyle:
//                                 IOSUIModalPresentationStyle.OVER_FULL_SCREEN)));
//               },
//               child: Text("Open Chrome Safari Browser")),
//         ));
//   }
// }
