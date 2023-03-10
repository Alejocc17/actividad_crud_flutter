import 'package:app_crud_flutter/home_page.dart';
import 'package:app_crud_flutter/text_box.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  late TextEditingController controllerName;
  late TextEditingController controllerDescription;
  late TextEditingController controllerPrice;

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerDescription = new TextEditingController();
    controllerPrice = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 46, 124, 60),
          title: Text("Crear nuevo producto"),
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
                primary: Color.fromARGB(255, 46, 125, 60), // Background color
                onPrimary: Color.fromARGB(
                    255, 255, 255, 255), // Text Color (Foreground color)
              ),
              child: const Text(
                'Guardar producto',
                //style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ));
  }
}
