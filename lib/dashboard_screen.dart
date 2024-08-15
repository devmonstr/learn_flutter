import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  child: ClipOval(
                child: Text('data'),
              )),
              Text('data'),
              Text('data'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary),
                        onPressed: () => context.go('/'),
                        label: Text('Logout'),
                        icon: Icon(Icons.logout),
                      ),
                    )
                  ],
                ),
              ),
              //Text('data'),
            ],
          ),
        ),
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
