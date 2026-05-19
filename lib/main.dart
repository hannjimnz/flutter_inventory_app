import 'package:flutter/material.dart';
import 'package:inventario_app/models/producto.dart';
import 'screens/inventario_screen.dart';

void main(){
  runApp(const InventarioApp());
}

class InventarioApp extends StatelessWidget{
  const InventarioApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario',
      home: Scaffold(
        appBar: AppBar(title: const Text('inventario')),
        body: ListView(
          children: inventario.map((p) => ListTile(
            title: Text(p.nombre),
            subtitle: Text("Cantidad: ${p.cantidad} - Precio: \$${p.precio}"),
          )).toList(),
        ),
      ),
    );
  }
}