import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main(){
  runApp(const InventarioApp());
}

class InventarioApp extends StatelessWidget {
  const InventarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Inventario',
      home: LoginScreen(), 
    );
  }
}