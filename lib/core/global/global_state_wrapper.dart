// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'theme_state.dart';
import 'user_state.dart';

// Public class to expose global states
class GlobalStates {
  final UserState userState;
  final ThemeState themeState;

  GlobalStates({
    required this.userState,
    required this.themeState,
  });
}

class GlobalStateWrapper extends StatefulWidget {
  final Widget Function(BuildContext, GlobalStates) builder;

  const GlobalStateWrapper({super.key, required this.builder});

  static GlobalStates of(BuildContext context) {
    final _GlobalStateWrapperState? state = context.findAncestorStateOfType<_GlobalStateWrapperState>();
    if (state == null) {
      throw Exception('No GlobalStateWrapper found in context');
    }
    return GlobalStates(
      userState: state.userState,
      themeState: state.themeState,
    );
  }

  @override
  State<GlobalStateWrapper> createState() => _GlobalStateWrapperState();
}

class _GlobalStateWrapperState extends State<GlobalStateWrapper> {
  final UserState userState = UserState();
  final ThemeState themeState = ThemeState();

  @override
  void initState() {
    super.initState();
    userState.addListener(_update);
    themeState.addListener(_update);
  }

  @override
  void dispose() {
    userState.removeListener(_update);
    themeState.removeListener(_update);
    super.dispose();
  }

  void _update() {
    setState(() {}); // Triggers rebuild of MaterialApp
  }

  @override
  Widget build(BuildContext context) {
    final globalStates = GlobalStates(
      userState: userState,
      themeState: themeState,
    );
    return widget.builder(context, globalStates);
  }
}
