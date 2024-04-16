import 'package:flutter/material.dart';
import 'package:iotapp/providers/pills_provider.dart';
import 'package:provider/provider.dart';

class MyPillsEdit extends StatefulWidget {
  const MyPillsEdit({Key? key});

  @override
  _MyPillsEditState createState() => _MyPillsEditState();
}

class _MyPillsEditState extends State<MyPillsEdit> {
  String newName = '';
  int selectedInterval = 1; // Valor inicial

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<DataProvider>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: AppBar(
            backgroundColor: Colors.lightBlue[100],
            title: Text(
              'Pill-ka-boo!',
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.w900,
                fontSize: 50,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Container(
              width: 380,
              height: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.white, width: 2.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    title: Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Widget para ingresar nombre de la píldora
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              newName = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pill name',
                            prefixIcon: Icon(Icons.medication_outlined),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Widget para ingresar el intervalo de tiempo
                        DropdownButton<int>(
                          value: selectedInterval,
                          onChanged: (newValue) {
                            setState(() {
                              selectedInterval = newValue!;
                            });
                          },
                          items: List.generate(24, (index) {
                            return DropdownMenuItem<int>(
                              value: index + 1,
                              child: Text('Each ${index + 1} hours',
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 18,
                                  )),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // Botón para guardar los cambios
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              // Crear una nueva píldora
                              PillsProvider newPill = PillsProvider(
                                name: newName,
                                interval: selectedInterval,
                              );

                              // Agregar la nueva píldora a la lista
                              dataProvider.addPill(newPill);
                              // Mostrar mensaje de éxito
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Pill added!"),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue[900],
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'Done',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
