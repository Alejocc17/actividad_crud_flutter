import 'package:app_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/text_box.dart';

class ModifyProduct extends StatefulWidget {
  final Product _product;
  ModifyProduct(this._product);
  @override
  State<StatefulWidget> createState() => _ModifyProduct();
}

class _ModifyProduct extends State<ModifyProduct> {
  late TextEditingController controllerName;
  late TextEditingController controllerDescription;
  late TextEditingController controllerPrice;

  @override
  void initState() {
    Product c = widget._product;
    controllerName = new TextEditingController(text: c.name);
    controllerDescription = new TextEditingController(text: c.description);
    controllerPrice = new TextEditingController(text: c.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 124, 60),
        title: Text("Editar producto"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerDescription, "Descripción"),
          TextBox(controllerPrice, "Precio"),
          ElevatedButton(
            onPressed: () {
              String name = controllerName.text;
              String description = controllerDescription.text;
              String price = controllerPrice.text;

              if (name.isNotEmpty &&
                  description.isNotEmpty &&
                  price.isNotEmpty) {
                Navigator.pop(
                    context,
                    new Product(
                        name: name, description: description, price: price));
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 46, 124, 60), // Background color
              onPrimary: Color.fromARGB(
                  255, 255, 255, 255), // Text Color (Foreground color)
            ),
            child: const Text(
              'Guardar cambios',
              //style: TextStyle(fontSize: 14, fontFamily: ),
            ),
          ),
        ],
      ),
    );
  }
}
