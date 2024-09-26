import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// Statesa
class ThemeState {
  final bool isDarkTheme;
  ThemeState({required this.isDarkTheme});
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDarkTheme: false)) {
    on<ToggleTheme>(_onToggleTheme);
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    emit(ThemeState(isDarkTheme: isDarkTheme));
  }

  Future<void> _onToggleTheme(
      ToggleTheme event, Emitter<ThemeState> emit) async {
    final currentTheme = state.isDarkTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', !currentTheme);
    emit(ThemeState(isDarkTheme: !currentTheme));
  }
}
