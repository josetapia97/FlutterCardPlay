import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isdev = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isdev,
          title: const Text('Modo desarrollador'),
          subtitle: const Text('Controles adicionales'),
          onChanged: (value) => setState(() {
            isdev = !isdev;
          }),
        ),
        RadioListTile(
          title: const Text('By Car'),
          subtitle: const Text('Brrrrum'),
            value: Transportation.car,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.car;
                })),
        RadioListTile(
          title: const Text('By Boat'),
          subtitle: const Text('Remo remo'),
            value: Transportation.boat,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.boat;
                })),
        RadioListTile(
          title: const Text('By Plane'),
          subtitle: const Text('Flyy'),
            value: Transportation.plane,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.plane;
                })),
        RadioListTile(
          title: const Text('By Submarine'),
          subtitle: const Text('Glup glup'),
            value: Transportation.submarine,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.submarine;
                }))
      ],
    );
  }
}
