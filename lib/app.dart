import 'package:flutter/material.dart';
import 'package:harmony/core/global/global_state_wrapper.dart';
import 'package:harmony/core/routers/app_router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalStateWrapper(
      builder: (context, globalStates) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: globalStates.themeState.theme,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
