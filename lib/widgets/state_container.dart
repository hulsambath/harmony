import 'package:flutter/material.dart';

class StateContainer<T extends LocalViewModel> extends StatefulWidget {
  final T viewModel;
  final Widget Function(BuildContext, T) builder;

  const StateContainer({
    super.key,
    required this.viewModel,
    required this.builder,
  });

  @override
  State<StateContainer<T>> createState() => _StateContainerState<T>();
}

class _StateContainerState<T extends LocalViewModel> extends State<StateContainer<T>> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.update = setState;
  }

  @override
  void didUpdateWidget(StateContainer<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModel != oldWidget.viewModel) {
      widget.viewModel.update = setState;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.viewModel);
  }
}

abstract class LocalViewModel {
  late void Function(void Function()) update;

  LocalViewModel() {
    update = (_) {};
  }

  void dispose() {
    update = (_) {};
  }
}
