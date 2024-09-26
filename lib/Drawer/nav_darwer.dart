import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/Class/destination_drawer.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        setState(() {
          selectedPage = index;
          print(index);
        });
      },
      selectedIndex: selectedPage,
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Text('data'),
              UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                    color: Colors.white,
                  )
                ],
                currentAccountPicture: CircleAvatar(
                  child: Text('MT'),
                ),
                accountName: Text('Monstr'),
                accountEmail: Text('baby@monstr.dev'),
              ),
            ],
          ),
        ),
        ...destinations.map(
          (MyDestination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
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
    );
  }
}


  /*
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
  }*/

