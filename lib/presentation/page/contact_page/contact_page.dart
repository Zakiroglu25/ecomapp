import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/contact_page/widget/sosial_item.dart';

import '../../../infrastructure/cubit/contact_cubit/contact_cubit.dart';
import '../../../infrastructure/cubit/contact_cubit/contact_state.dart';
import '../../../infrastructure/model/response/contact_model.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/general/empty_widget.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: "Əlaqə",
      user: false,
      notification: false,
      child: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
          if (state is ContactSuccess) {
            final List<Contacts> contactList = state.contact;
            return SocialItem(contact: contactList
                // name: contact.data[index].channel,
                // path: Assets.pngWhatsapp,
                // onTap: () {},
                // isPng: true,
                );
            // return Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     children: [
            //       ProductAndOtherWidget(
            //         color: MyColors.purple,
            //         h: 167.h,
            //         imageUrl: Assets.pngContact3x,
            //         title: MyText.contact,
            //         desc: MyText.contactDesc,
            //       ),
            //       // SocialItem(
            //       //   name: "Whatsapp",
            //       //   path: Assets.pngWhatsapp,
            //       //   onTap: () {},
            //       //   isPng: true,
            //       // ),
            //       // SocialItem(
            //       //   name: "Telegram",
            //       //   path: Assets.pngTelegram,
            //       //   onTap: () {},
            //       //   isPng: true,
            //       // ),
            //       // SocialItem(
            //       //   name: "Facebook",
            //       //   path: Assets.pngFacebook,
            //       //   onTap: () {},
            //       //   isPng: true,
            //       // ),
            //       // SocialItem(
            //       //   name: "*8833",
            //       //   path: Assets.pngHotline,
            //       //   onTap: () {},
            //       //   content: "Qaynar xətt",
            //       //   isPng: true,
            //       // )
            //     ],
            //   ),
            // );
          } else if (state is ContactInProgress) {
            return const AppLoading();
          } else if (state is ContactError) {
            return EmptyWidget();
          } else {
            return EmptyWidget();
          }
        },
      ),
    );
  }
}
