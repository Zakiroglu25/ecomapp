import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/widgets/custom/app_tab.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/text.dart';

class CupperProvider extends ChangeNotifier {
  late AppTab _selected;
  late Color _color = MyColors.green;

  AppTab get selected => _selected;

  set selected(AppTab value) {
    _selected = value;
  }

  void configAppTab({required List<AppTab> initialTabs, int? first}) {
    if (first == null) {
      selected = initialTabs.first;
    } else {
      selected = initialTabs[first];
    }
    tabs.addAll(initialTabs);
    notifyListeners();
  }

  void changeTab(AppTab tab) async {
    // tabs = [
    //   AppTab(
    //     text: MyText.address,
    //     // iconData: Icons.shopping_bag,
    //     // count: 5,
    //     // index: 0,
    //   ),
    //   AppTab(
    //     text: MyText.cart,
    //     // iconData: Icons.shopping_bag,
    //     // count: 5,
    //     // index: 1,
    //   ),
    //   AppTab(
    //     text: MyText.recipe,
    //     // iconData: Icons.shopping_bag,
    //     // count: 5,
    //     // index: 2,
    //   ),
    // ];
    selected = tab;
    tabs = tabs.map<AppTab>((AppTab e) {
      e.text == selected.text
          ? e.color = MyColors.main
          : e.color = MyColors.black34;
      return e;
    }).toList();

    notifyListeners();
  }

  void incrementCounter({required List<AppTab> tabo}) {
    tabs = [
      // Tab(
      //   height: 70,
      //   text: "jhgjhj",
      // ),
      AppTab(
        text: MyText.address,
        // iconData: Icons.shopping_bag,
        // count: 5,
        // index: 0,
      ),
      AppTab(
        text: MyText.cart,
        // iconData: Icons.shopping_bag,
        // count: 5,
        // index: 1,
      ),
      AppTab(
        text: MyText.recipe,
        // iconData: Icons.shopping_bag,
        // count: 5,
        // index: 2,
      ),
    ];
    notifyListeners();
  }

  List<AppTab> _tabs = [];

  Color get color => _color;

  set color(Color value) {
    _color = value;
    notifyListeners();
  }

  List<AppTab> get tabs => _tabs;

  set tabs(List<AppTab> value) {
    _tabs = value;
    notifyListeners();
  }
}
