import 'package:doctoro/utils/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infrastructure/cubit/authentication/authentication_cubit.dart';
import 'infrastructure/cubit/authentication/authentication_state.dart';
import 'utils/delegate/pager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationSplash) {
        return CircularProgressIndicator();
      } else if (state is AuthenticationLoading) {
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      } else if (state is AuthenticationServerError) {
        return const SafeArea(
          child: Scaffold(
              body: Center(
            child: Text("MyText.error"),
            // refreshButton: () =>
            //   context.read<AuthenticationCubit>()
            //     ..startApp(context, showSplash: false),
          )),
        );
      }
      if (state is AuthenticationUninitialized) {
        return Pager.login;
      } else if (state is AuthenticationAuthenticated) {
        return Pager.landing;
      } else {
        return Pager.login;
      }
    });
  }
}
