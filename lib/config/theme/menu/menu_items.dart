import 'package:flutter/material.dart';

class MenuItem {
  final String tittle;
  final String subtittle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.tittle,
      required this.subtittle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      tittle: 'Botones',
      subtittle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      tittle: 'Tarjetas',
      subtittle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      tittle: 'Progress Indicators',
      subtittle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      tittle: 'Snackbars y Diálogos',
      subtittle: 'Indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItem(
      tittle: 'Animacion de contenedor',
      subtittle: 'Animaciones dinamicas',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      tittle: 'UI controls & Tiles',
      subtittle: 'Una serie de controles',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      tittle: 'Tutorial de la App',
      subtittle: 'Guía ilustrativa de como usar la app',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      tittle: 'Scroll infinito',
      subtittle: 'Consumo de contenido y actualizacion',
      link: '/scroll',
      icon: Icons.list_alt_rounded),
  MenuItem(
      tittle: 'Contador Simple',
      subtittle: 'Introduccion a Riverpod',
      link: '/counter_screen',
      icon: Icons.countertops),
  MenuItem(
      tittle: 'Temas de la aplicacion',
      subtittle: 'Utilizacion de Material 3 y Riverpod',
      link: '/themechanger',
      icon: Icons.color_lens_outlined),
];
