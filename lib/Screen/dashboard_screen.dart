import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/Drawer/nav_darwer.dart';

class DashboardScreen extends StatelessWidget {
  /// Constructs a [DashboardScreen]
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Screen'),
          actions: [
            IconButton(
              onPressed: (() => context.push('/settings')),
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        drawer: NavDarwer(),
        body: Center(
          child: SizedBox(
            height: 40,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () => context.push('/details'),
              child: const Text('Go to the Details screen'),
            ),
          ),
        ),
      ),
    );
  }
}
