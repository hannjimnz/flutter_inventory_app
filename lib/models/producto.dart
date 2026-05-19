class Producto{
  String nombre;
  int cantidad;
  double precio;

  Producto({required this.nombre, required this.cantidad, required this. precio});
}
final List<Producto> inventario = [
  Producto(nombre: "Laptop", cantidad: 5, precio: 12000),
  Producto(nombre: "Mouse", cantidad: 20, precio: 250),
];