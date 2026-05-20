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
      body: ListView.builder(
        itemCount: inventario.length,
        itemBuilder: (BuildContext context, int index) {
          final producto = inventario[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.inventory),
              title: Text(producto.nombre),
              subtitle: Text("Cantidad: ${producto.cantidad} - Precio: \$${producto.precio}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      _editarProducto(producto, index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _eliminarProducto(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddProductScreen(
                onAdd: (producto) {
                  setState(() {
                    inventario.add(producto);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _eliminarProducto(int index) {
    setState(() {
      inventario.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Producto eliminado")),
    );
  }

  void _editarProducto(Producto producto, int index) async {
    final actualizado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AddProductScreen(productoExistente: producto),
      ),
    );

    if (actualizado != null) {
      setState(() {
        inventario[index] = actualizado;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Producto actualizado")),
      );
    }
  }
}
