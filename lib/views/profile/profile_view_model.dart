import 'package:flutter/material.dart';

import '../../widgets/state_container.dart';

class ProfileViewModel extends LocalViewModel {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  String? _name;
  String? get name => _name;

  void updateName(String newName) {
    _name = newName;
    update(() {});
  }
}
