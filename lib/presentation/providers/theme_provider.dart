import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Un simple boolean
final isDarkMode = StateProvider((ref) => false);

//Listado de colors inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple entero
final selectedColorProvider = StateProvider((ref) => 0);

//Un objeto de tipo  AppThheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  //el que controla es themenotifier y lo que controla es una instancia de apptheme
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //El estado es una nueva apptheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex(int colorIndex) {
    if (colorIndex >= 0 && colorIndex < colorList.length) {
      state = state.copyWith(selectedColor: colorIndex);
    }
  }
}
