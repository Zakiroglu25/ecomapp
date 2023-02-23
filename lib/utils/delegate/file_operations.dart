// Flutter imports:
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../constants/text.dart';
import '../screen/alert.dart';
import '../screen/snack.dart';

class FileOperations {
  FileOperations._();

  static Future<File?> checkAndPickImage(
      {required BuildContext context, required ImageSource imageSource}) async {
    try {
      bool isAndroidAndSdkOld = Platform.isAndroid &&
          (await DeviceInfoPlugin().androidInfo).version.sdkInt <= 32;
      var galleryAccessStatus;
      var cameraAccessStatus = await Permission.camera.status;
      galleryAccessStatus = await _checkGalleryStatus(isAndroidAndSdkOld);
      if (galleryAccessStatus != PermissionStatus.granted ||
          cameraAccessStatus != PermissionStatus.granted) {
        var statusPhotos = await _checkGalleryStatus(isAndroidAndSdkOld);
        if (statusPhotos != PermissionStatus.granted) {
          await showGalleryAccessAlert(context);
        } else {
          return await FileOperations.pickPhoto(imageSource: imageSource);
        }
      } else {
        return await FileOperations.pickPhoto(imageSource: imageSource);
      }
    } on PlatformException catch (e, s) {
      await showGalleryAccessAlert(context);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      Snack.showOverlay(context: context, message: e.toString());
    }
  }

  static Future<dynamic> _checkGalleryStatus(bool isAndroidAndSdkOld) async {
    await Permission.camera.request();
    if (isAndroidAndSdkOld) {
      await Permission.storage.request();
      return await Permission.storage.status;
    } else {
      await Permission.photos.request();
      return await Permission.photos.status;
    }
  }

  static Future<File?> pickPhoto({ImageSource? imageSource}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: imageSource ?? ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      return imageFile;
    }
  }

  static Future<void> showGalleryAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_gallery,
        content: MyText.we_will_redirect_to_settings_gallery,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

// static void exitDialog(BuildContext context) {
//   Alert.show(context, image: Image.asset(Assets.pngQifil), cancelButton: true,
//       onTap: () {
//     return context.read<AuthenticationCubit>()
//       ..logOut(context, goWithPager: true);
//   }, title: MyText.are_u_sure_exit);
// }
//
// static Future<File?> pickPhotoFromGallery({ImageSource? imageSource}) async {
//   XFile? pickedFile = await ImagePicker().pickImage(
//     source: imageSource ?? ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//     //updateImage(imageFile);
//     // bbbb("image picked succesfully!");
//     return imageFile;
//   }
// }

}
