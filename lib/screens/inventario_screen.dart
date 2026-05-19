import 'package:flutter/material.dart';
import '../models/producto.dart';

class InventarioScreen extends StatelessWidget{
  final List<Producto> inventario = [
    Producto(nombre: "Laptop", cantidad: 5, precio: 12000),
    Producto(nombre: "Mause", cantidad: 20, precio: 250),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario')),
      body: ListView(
        children: inventario.map((p) => ListTile(
          title: Text(p.nombre),
          subtitle: Text("Cantidad: ${p.cantidad} - Precio: ${p.precio}"),
        )).toList(),

      ),

    );
  }
}