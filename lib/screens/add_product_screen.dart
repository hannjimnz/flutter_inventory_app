import 'package:flutter/material.dart';
import '../models/producto.dart';

class AddProductScreen extends StatefulWidget {
  final Producto? productoExistente;
  final Function (Producto)? onAdd;

  const AddProductScreen({super.key, this.productoExistente, this.onAdd});

  @override
  State<AddProductScreen> createState() => _AddProductScreen();
  
}

class _AddProductScreen extends State<AddProductScreen>{
  final _formkey = GlobalKey<FormState>();
  late  TextEditingController _nameController;
  late  TextEditingController _quantityController ;
  late   TextEditingController _priceController;

  @override
  void initState(){
    super.initState();
    _nameController = TextEditingController(text: widget.productoExistente?.nombre ?? "");
    _quantityController = TextEditingController(text: widget.productoExistente != null ? widget.productoExistente!.cantidad.toString() : "",
);

    _priceController = TextEditingController( text: widget.productoExistente != null ? widget.productoExistente!.precio.toString() : "",
);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar ( 
        title: Text(widget.productoExistente == null? "Agregar producto" : "Editar produto"),
      ),
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
                    final producto = Producto(
                      nombre: _nameController.text,
                      cantidad: int.parse(_quantityController.text),
                      precio: double.parse(_priceController.text),

                    );
                    if (widget.onAdd != null){
                      widget.onAdd!(producto); //solo si lo agregara
                    }
                    Navigator.pop(context, producto); //devuelve los productos a inventario_screen
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
