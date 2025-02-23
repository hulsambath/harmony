import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:harmony/core/global/global_state_wrapper.dart';
import 'package:harmony/views/home/home_view_model.dart';
import 'package:harmony/widgets/state_container.dart';

part 'home_view.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StateContainer(
      viewModel: HomeViewModel(),
      builder: (context, viewModel) {
        return _HomeView(viewModel: viewModel);
      },
    );
  }
}
