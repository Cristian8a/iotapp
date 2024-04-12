import 'package:flutter/material.dart';
import 'package:iotapp/providers/pills_provider.dart';
import 'package:provider/provider.dart';

class MyPillsEdit extends StatelessWidget {
  const MyPillsEdit({Key? key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<DataProvider>();

    String newName = '';
    int newInterval = 0;

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
              height: 500,
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
                            newName = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pill name',
                            prefixIcon: Icon(Icons.medication_outlined),
                          ),
                        ),
                        // Widget para ingresar el intervalo de tiempo
                        DropdownButton<int>(
                          value: newInterval,
                          onChanged: (newValue) {
                            newInterval = newValue!;
                          },
                          items: List.generate(24, (index) {
                            return DropdownMenuItem<int>(
                              value: index + 1,
                              child: Text('${index + 1} hours'),
                            );
                          }),
                        ),
                        // Botón para guardar los cambios
                        ElevatedButton(
                          onPressed: () {
                            // Crear una nueva píldora
                            PillsProvider newPill = PillsProvider(
                              name: newName,
                              interval: newInterval,
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
                          child: Text('Done'),
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
