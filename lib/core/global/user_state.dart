import 'package:flutter/material.dart';

class UserState {
  String _userName = 'Guest';
  String get userName => _userName;

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) => _listeners.add(listener);
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  void setUserName(String name) {
    _userName = name;
    _notifyListeners();
  }
}
