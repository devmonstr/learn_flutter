import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardSubScr extends StatelessWidget {
  const DashboardSubScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
