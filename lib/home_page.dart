import 'package:app_crud_flutter/add_product.dart';
import 'package:app_crud_flutter/message_response.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/modify_product.dart';

class Home_Page extends StatefulWidget {
  final String _title;
  Home_Page(this._title);
  @override
  State<StatefulWidget> createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page> {
  List<Product> products = [
    Product(
        name: 'Cuaderno',
        description: 'Rayado 100 hojas, cocido',
        price: '3000'),
    Product(
        name: 'Cuaderno',
        description: 'Cuadriculado 100 hojas, cocido',
        price: '3000'),
    Product(
        name: 'Cuaderno',
        description: 'Doblelínea 100 hojas, cocido',
        price: '3000')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //img:Image.asset('images/img.jpg'),
      appBar: AppBar(
        toolbarHeight: 140, // Set this height
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image.asset('assets/logo.jpg'),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              const Text(
                "Inventario de Productos T de A",
                style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(248, 1, 4, 21),
                  //backgroundColor: Color.fromARGB(255, 255, 255, 255)
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AddProduct()))
                      .then((newProduct) {
                    if (newProduct != null) {
                      setState(() {
                        products.add(newProduct);
                        messageResponse(context,
                            newProduct.name + "ha sido creado con exito!...");
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 46, 124, 60), // Background color
                  onPrimary: Color.fromARGB(
                      255, 255, 255, 255), // Text Color (Foreground color)
                ),
                child: const Text(
                  'Ingresar producto',
                  style: TextStyle(fontSize: 15),
                ),
              )
              //tooltip: "Add new product",
            ],
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyProduct(products[index])))
                  .then((newProduct) {
                if (newProduct != null) {
                  setState(() {
                    products.removeAt(index);

                    products.insert(index, newProduct);

                    messageResponse(
                        context, newProduct.name + " ha sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeProduct(context, products[index]);
            },
            title: Text(products[index].name),
            subtitle: Text(
                products[index].description + " COP " + products[index].price),
            leading: Card(
              child: Text(products[index].name.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.bookmark_outline_outlined,
              color: const Color.fromARGB(255, 42, 115, 55),
            ),
          );
        },
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddProduct()))
                .then((newProduct) {
              if (newProduct != null) {
                setState(() {
                  products.add(newProduct);
                  messageResponse(context,
                      newProduct.name + "ha sido creado con exito!...");
                });
              }
            });
          },
          tooltip: "Add new product",
          child: Icon(Icons.add),
        )*/
    );
  }

  removeProduct(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar producto"),
              content: Text("Esta seguro de eliminar a " + product.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.products.remove(product);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Product {
  var name;
  var description;
  var price;

  Product({this.name, this.description, this.price});
}
