import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /*
  bool _isDarkMode = false;

  void initState() {
    super.initState();
    _loadSwitchState();
  }

  void _loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('switchState') ?? false;
    });
  }

  void _darkModeSwitch() {
    setState(() async {
      if (_isDarkMode == false) {
        _isDarkMode = true;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('switchState', _isDarkMode);
      } else if (_isDarkMode == true) {
        _isDarkMode = false;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('switchState', _isDarkMode);
      }
    });
  }*/

  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
  }

// Load the saved switch state from SharedPreferences
  void _loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('switchState') ?? false;
    });
  }

// Toggle the dark mode switch and save the state
  void _darkModeSwitch() async {
    setState(() {
      /*
      if (_isDarkMode == false) {
        _isDarkMode = true;
      } else if (_isDarkMode == true) {
        _isDarkMode = false;
      }*/

      _isDarkMode = !_isDarkMode;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('switchState', _isDarkMode);

    if (kDebugMode) {
      print(_isDarkMode);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SettingsList(
          darkTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).colorScheme.surface),
          lightTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).colorScheme.surface),
          sections: [
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_isDarkMode) {
                    _darkModeSwitch();
                  },
                  initialValue: _isDarkMode,
                  leading: Icon(Icons.nights_stay),
                  title: Text('Dark Mode'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
