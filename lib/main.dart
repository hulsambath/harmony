import 'package:flutter/material.dart';
import 'package:harmony/core/global/global_state_wrapper.dart';
import 'package:harmony/views/home/home_screen.dart';
import 'package:harmony/views/home/home_view_model.dart';
import 'package:harmony/widgets/state_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalStateWrapper(
      builder: (context, globalStates) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: globalStates.themeState.theme,
          home: const MyHomePage(title: 'Harmony'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StateContainer(
      viewModel: HomeViewModel(),
      builder: (context, viewModel) {
        return HomeScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}
