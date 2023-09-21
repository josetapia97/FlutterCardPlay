import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDark = ref.watch(isDarkMode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Temas'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.dark_mode_outlined : Icons.light_mode))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colores = ref.watch(colorListProvider);

    return ListView.builder(
      itemCount: colores.length,
      itemBuilder: (context, index) {
        final Color color = colores[index];

        return RadioListTile(
            title: Text('Este color',style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: 0,
            onChanged: (value) {
              //todo: notificar el cambio
            });
      },
    );
  }
}
