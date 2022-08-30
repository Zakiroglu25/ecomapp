import 'package:doctoro/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infrastructure/services/config_service.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/assets.dart';

class UserPage extends StatelessWidget {
  HiveService get _prefs => locator<HiveService>();
  static ConfigService get _configs => locator<ConfigService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: <Color>[
                MyColors.userGradient2,
                MyColors.userGradient1,
                MyColors.userGradient,
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      MyColors.userGradient2,
                      MyColors.userGradient1,
                      MyColors.userGradient,
                    ])),
                height: 114.0,
              ),
            ],
          ),
          Positioned(
            top: 64.0,
            child: Container(
              height: 140.0,
              width: 140.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          Positioned(
            top: 76.0,
            child: Container(
              child: Center(
                child: SvgPicture.asset(Assets.svgWhiteLogo),
              ),
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: MyColors.userPhoto),
            ),
          ),
          Positioned(
            top: 210,
            child: Column(
              children: [
                Text(_prefs.isGuest.toString()),
                Text(_prefs.isLoggedIn.toString()),
                Text(_prefs.user.firstName.toString()),
                Text("dlmvklesvkeklv"),
                Text("dlmvklesvkeklv"),
                Text("dlmvklesvkeklv"),
                Text("dlmvklesvkeklv"),
                Text("dlmvklesvkeklv"),
                Text("dlmvklesvkeklv"),
                Text("dlmvklesvkeklv"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
