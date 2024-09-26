import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/Class/destination_drawer.dart';
import 'package:learn_flutter/Screen/Sub_screen/profile_sub_scr.dart';
import 'package:learn_flutter/Screen/Sub_screen/todo_sub_scr.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    TodoSubScr(),
    ProfileSubScr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: (() => context.push('/settings')),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
          Navigator.pop(context); // Close the drawer
        },
        children: <Widget>[
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
          ...destinations.map(
            (MyDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(16.0),
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
      body: pages[selectedIndex], // Display the selected page
    );
  }
}


/* 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: (() => context.push('/settings')),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      //drawer: NavDrawer(),
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
            print(index);
          });
        },
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
          Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(16.0),
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
      body: pages(selectedIndex),
    );
  }
*/


/*
class DashboardScreen extends StatelessWidget {
  /// Constructs a [DashboardScreen]
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: (() => context.push('/settings')),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: NavDrawer(),
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
    );
  }
}
*/