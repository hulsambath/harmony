part of 'home.dart';

class _HomeView extends StatelessWidget {
  final HomeViewModel viewModel;

  const _HomeView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final globalStates = GlobalStateWrapper.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorScheme.of(context).primary,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              globalStates.themeState.isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round,
            ),
            tooltip: 'Switch Theme',
            onPressed: () {
              globalStates.themeState.toggleTheme();
              viewModel.update(() {});
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Local Counter: ${viewModel.counter}'),
            Text('User: ${globalStates.userState.userName}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
