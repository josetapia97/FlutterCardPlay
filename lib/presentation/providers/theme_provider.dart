import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//un simple boolean
final isDarkMode = StateProvider((ref) => false);

//Listado de colors inmutable
final colorListProvider = Provider((ref) => colorList);

//un simple entero
final selectedColorProvider = StateProvider((ref) => 0);
