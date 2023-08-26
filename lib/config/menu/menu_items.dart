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

];