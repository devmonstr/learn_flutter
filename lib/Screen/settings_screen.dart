import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc/theme_bloc.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return SettingsList(
              darkTheme: SettingsThemeData(
                  settingsListBackground:
                      Theme.of(context).colorScheme.surface),
              lightTheme: SettingsThemeData(
                  settingsListBackground:
                      Theme.of(context).colorScheme.surface),
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
                      onToggle: (bool value) {
                        BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
                      },
                      initialValue: state.isDarkTheme,
                      leading: Icon(Icons.nights_stay),
                      title: Text('Dark Mode'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
