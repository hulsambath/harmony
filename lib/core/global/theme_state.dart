// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:harmony/core/theme/theme_config.dart';

class ThemeState {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) => _listeners.add(listener);
  void removeListener(VoidCallback listener) => _listeners.remove(listener);
  void _notifyListeners() => _listeners.forEach((l) => l());

  ThemeData get theme => _isDarkTheme ? ThemeConfig.dark().themeData : ThemeConfig.light().themeData;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _notifyListeners();
  }
}
