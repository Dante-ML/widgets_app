//Opciones del menu a usar

import 'package:flutter/material.dart';

class MenuItem {
  final String tittle;
  final String subTittle;
  final String url;
  final IconData icon;

  const MenuItem({
    required this.tittle, 
    required this.subTittle, 
    required this.url, 
    required this.icon
  });

}

const List<MenuItem> appMenuItems = [
  MenuItem(
    tittle: 'Botones', 
    subTittle: 'Vario botones en flutter', 
    url: '/buttons', 
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    tittle: 'Tarjetas', 
    subTittle: 'Un contenedor estilizado', 
    url: '/cards', 
    icon: Icons.credit_card,
  ),

  MenuItem(
    tittle: 'Progress Indicators', 
    subTittle: 'Generales y controlados', 
    url: '/progress', 
    icon: Icons.refresh_rounded,
  ),

  MenuItem(
    tittle: 'Snackbars y dialogos', 
    subTittle: 'Indicadores en pantalla', 
    url: '/snackbars', 
    icon: Icons.info_outline,
  ),

  MenuItem(
    tittle: 'Animated container', 
    subTittle: 'Stateful widget animado', 
    url: '/animated', 
    icon: Icons.check_box_outline_blank_rounded,
  ),

  MenuItem(
    tittle: 'Ui controls + Tiles', 
    subTittle: 'Serie de controles en flutter', 
    url: '/ui-controls', 
    icon: Icons.car_rental_sharp,
  ),
];