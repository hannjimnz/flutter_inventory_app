import 'package:flutter/material.dart';
import 'package:inventario_app/models/producto.dart';
import 'screens/inventario_screen.dart';

void main(){
  runApp(const InventarioApp());
}

class InventarioApp extends StatelessWidget {
  const InventarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Inventario',
      home: InventarioScreen(), 
    );
  }
}