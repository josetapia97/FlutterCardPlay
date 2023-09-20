import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + material 3'),
      ),
      body: const _HomeView(),
      drawer: const SideMenu(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return _ListTileCustom(menuItem: menuItem);
      },
    );
  }
}

class _ListTileCustom extends StatelessWidget {
  const _ListTileCustom({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon,
          color: colors.primary), // Puedes agregar un ícono si lo deseas.
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.tittle),
      subtitle: Text(menuItem.subtittle), // Agregamos el subtítulo aquí.
      onTap: () {
        //navegar con go_router
        //context.pushNamed(CardsScreen.name);
        context.push(menuItem.link);
      },
    );
  }
}
