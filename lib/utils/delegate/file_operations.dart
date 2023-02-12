// Flutter imports:
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uikit/infrastructure/config/recorder.dart';

import '../constants/text.dart';
import '../screen/alert.dart';
import '../screen/snack.dart';

class FileOperations {
  FileOperations._();

  static Future<File?> checkAndPickImage(
      {required BuildContext context, required ImageSource imageSource}) async {
    try {
      var galleryAccessStatus = await Permission.photos.status;
      var cameraAccessStatus = await Permission.camera.status;

      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 32) {
          /// use [Permissions.storage.status]
          await Permission.storage.request();
        } else {
          /// use [Permissions.photos.status]
          await Permission.photos.request();
          await Permission.camera.request();
        }
      } else {
        await Permission.photos.request();
        await Permission.camera.request();
      }
      if (galleryAccessStatus != PermissionStatus.granted ||
          cameraAccessStatus != PermissionStatus.granted) {
        var statusPhotos = await Permission.photos.request();
        var statusCamera = await Permission.camera.request();
        // var status = await Permission.photos.request();
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
      Snack.display(context: context, message: e.toString());
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
