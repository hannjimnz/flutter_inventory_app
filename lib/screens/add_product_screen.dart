import 'package:flutter/material.dart';
import '../models/producto.dart';

class AddProductScreen extends StatefulWidget {
  final Function (Producto) onAdd;

  const AddProductScreen({super.key, required this.onAdd});

  @override
  State<AddProductScreen> createState() => _AddProductScreen();
  
}

class _AddProductScreen extends State<AddProductScreen>{
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar producto")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nombre del producto"),
                validator: (value) => value!.isEmpty ? "Agrega el nombre del producto" : null,
              ),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: "Cantidad"),
                keyboardType: TextInputType.number,
                validator: (value)=> value!.isEmpty ? "Agregar cantidad" : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Agrega un precio": null,



              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    final newProduct = Producto(
                      nombre: _nameController.text,
                      cantidad: int.parse(_quantityController.text),
                      precio: double.parse(_priceController.text),

                    );
                    widget.onAdd(newProduct);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        ),

      ),


    );
  }
}
