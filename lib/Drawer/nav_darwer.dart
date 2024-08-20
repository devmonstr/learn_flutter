import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavDarwer extends StatelessWidget {
  const NavDarwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Text('MT'),
                  ),
                  accountName: Text('Monstr'),
                  accountEmail: Text('baby@monstr.dev'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  onPressed: () => context.go('/'),
                  label: Text('Logout'),
                  icon: Icon(Icons.logout),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
