import 'package:doctoro/utils/constants/boxx.dart';
import 'package:doctoro/utils/delegate/navigate_utils.dart';
import 'package:doctoro/widgets/custom/doctoro_button.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverNavBarExample();
  }
}

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Cupperfold(
        title: 'Contacts',
        trailings: [Boxx()],
        child: Center(
          child: DoctoroButton(
            onTap: () {
              Go.to(context, SliverNavBarExample2());
            },
          ),
        ));
  }
}

class SliverNavBarExample2 extends StatelessWidget {
  const SliverNavBarExample2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Cupperfold(
        title: 'Contacts1',
        user: false,
        //trailings: [Boxx()],
        child: Center(
          child: DoctoroButton(
            onTap: () {
              Go.to(context, NextPage());
            },
          ),
        ));
  }
}

class NextPage extends StatelessWidget {
  const NextPage();

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemYellow,
            border: Border(
              bottom: BorderSide(
                color: brightness == Brightness.light
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
            ),
            // The middle widget is visible in both collapsed and expanded states.
            middle: const Text('Contacts Group'),
            // When the "middle" parameter is implemented, the larget title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
            largeTitle: const Text('Family'),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Drag me up', textAlign: TextAlign.center),
                // When the "leading" parameter is omitted on a route that has a previous page,
                // the back button is automatically added to the leading position.
                Text('Tap on the leading button to navigate back',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
