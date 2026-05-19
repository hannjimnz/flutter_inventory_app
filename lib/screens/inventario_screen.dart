import 'package:flutter/material.dart';
import 'package:inventario_app/screens/add_product_screen.dart';
import '../models/producto.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  final List<Producto> inventario = [
    Producto(nombre: "Laptop", cantidad: 5, precio: 12000),
    Producto(nombre: "Mouse", cantidad: 20, precio: 250),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario')),
      body: ListView(
        children: inventario.map((p) => ListTile(
          title: Text(p.nombre),
          subtitle: Text("Cantidad: ${p.cantidad} - Precio: \$${p.precio}"),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(
                onAdd: (producto) {
                  setState(() {
                    inventario.add(producto);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add), // aquí sí aparece el "+"
      ),
    );
  }
}
