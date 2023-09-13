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
       icon: Icons.smart_button_outlined
       ),
  MenuItem(
    tittle: 'Tarjetas',
     subtittle: 'Un contenedor estilizado',
      link: '/cards',
       icon: Icons.credit_card
       ),
  MenuItem(
    tittle: 'Progress Indicators',
     subtittle: 'Generales y controlados',
      link: '/progress',
       icon: Icons.refresh_rounded
       ),
  MenuItem(
    tittle: 'Snackbars y Diálogos',
     subtittle: 'Indicadores en pantalla',
      link: '/snackbar',
       icon: Icons.info_outline
       ),
];
