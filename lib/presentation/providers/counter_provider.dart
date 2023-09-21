import 'package:flutter_riverpod/flutter_riverpod.dart';

//Un provedor de un estado, una pequeña pieza de estado de nuestra info
//Ejemp:  cul es el estado de X clase?,  cual es valor de una variable numerica? , etc.
final counterProvider = StateProvider((ref) => 0);