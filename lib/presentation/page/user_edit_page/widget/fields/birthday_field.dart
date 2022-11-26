import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text.dart';
import '../field_c_lear_button.dart';

class BirthdayFieldUser extends StatelessWidget {
  TextEditingController controller;

  BirthdayFieldUser({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.text != null || controller.text != '') {
      BlocProvider.of<UserCubit>(context).updateBirthDate(controller.text);
    }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).birthDateStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.birth,
          maxLines: 1,
          hint: MyText.birth,
          upperCase: true,
          textInputType: TextInputType.datetime,
          textCapitalization: TextCapitalization.sentences,
          readOnly: true,
          suffixIcon: FieldCLearButton(
            BlocProvider.of<UserCubit>(context).birthDate.valueOrNull ??
                controller.text,
            onTap: () =>
                BlocProvider.of<UserCubit>(context).updateBirthDate(''),
            controller: controller,
          ),
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          onTap: () {
            _openDatePicker(context, controller, null);
          },
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateBirthDate(value),
        );
      },
    );
  }

  Future<void> _openDatePicker(BuildContext context,
      TextEditingController? birtController, String? initial) async {
    if (birtController?.text == null) {
      initial = DateFormat("yyy-MM-dd")

          .format(DateTime(DateTime.now().year - 18, 12, 31))
          .toString();
      birtController?.text = initial;
      BlocProvider.of<UserCubit>(context).updateBirthDate(
          new DateFormat("yyy-MM-dd")
              .format(DateTime(DateTime.now().year - 18, 12, 31))
              .toString());
    }
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext contextZ) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: MyColors.main,
                      child: IconButton(
                        icon: Icon(Icons.done, color: MyColors.newGREEN),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: IconButton(
                        icon: Icon(Icons.close, color: MyColors.main),
                        onPressed: () {
                          // BlocProvider.of<RegCubit>(context).updateBirthday("~");
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime(DateTime.now().year - 18, 12, 31),
                    onDateTimeChanged: (DateTime chosenDate) {
                      initial = new DateFormat("yyy-MM-dd")
                          .format(chosenDate)
                          .toString();
                      birtController?.text = new DateFormat("yyy-MM-dd")
                          .format(chosenDate)
                          .toString();
                      BlocProvider.of<UserCubit>(context).updateBirthDate(
                          new DateFormat("yyy-MM-dd")
                              .format(chosenDate)
                              .toString());
                    },
                    maximumYear: DateTime.now().year - 13,
                    minimumYear: 1900,
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
