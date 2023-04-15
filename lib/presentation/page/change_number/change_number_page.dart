import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import 'package:uikit/infrastructure/cubit/user/user_cubit.dart';
import 'package:uikit/presentation/page/user_edit_page/widget/fields/email_field.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/delegate/my_printer.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/delegate/string_operations.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../settings_page/widget/edit_field_widget.dart';
import 'widget/field/number_field.dart';
import 'widget/field/password_field.dart';

class ChangeNumberPage extends StatelessWidget {
  ChangeNumberPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<UserCubit>();
    return BlocProvider(
      create: (context) => AddAddressCubit(),
      child: Scaffold(
        appBar: DoctorAppbar(
          user: false,
          notification: false,
          filter: false,
          title: 'Nömrəni dəyiş',
        ),
        body: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserSuccess) {
              Go.to(context, Pager.otp());
              wtf("Deyishiklik oldu");
            } else if (state is UserFailed) {
              wtf("Deyishiklik olmadi");
            }
          },
          child: ListView(
            padding: Paddings.paddingH16,
            children: [
              EditFieldWidget(
                headText: "Nömrəniz",
                subTitle: "Mövcud nömrəniz",
                title: _prefs.user.phone,
                png: false,
                switchW: false,
                sufixImageUrl: Assets.svgCallDark,
                // prefixImageUrl: SvgPicture.asset(Assets.svgEdit),
              ),
              MySizedBox.h16,
              PhoneFieldUser(
                  controller:
                      StringOperations.stringToController(_prefs.user.phone)),
              EmailFieldUser(controller: StringOperations.stringToController(_prefs.user.email),),
              PasswordFieldUser(
                controller: controller!,
              ),
              AppButton(
                text: MyText.save,
                loading: cubit.state is UserLoading,
                onTap: () {
                  context.read<UserCubit>().changePhoneAndEmail(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
