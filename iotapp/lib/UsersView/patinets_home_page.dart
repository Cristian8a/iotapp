import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iotapp/UsersView/patients_config.dart';
// import 'package:iotapp/DoctorView/my_pills.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sertalinaValue = 0.0; // Valor inicial
  double valsartanValue = 0.1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Iniciar el temporizador para actualizar sertalinaValue cada hora (3600 segundos)
    _timer = Timer.periodic(Duration(hours: 1), (timer) {
      if (mounted) {
        // Actualizar sertalinaValue
        setState(() {
          sertalinaValue += 0.0417; // 1/24 para un intervalo de 1 hora
          if (sertalinaValue > 1) {
            sertalinaValue = 1; // Limitar a un máximo de 1
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // Detener el temporizador cuando se elimina el widget
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              height: 300,
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
                      'Take your pills',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sertalina',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '5 pills left',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                width: 380,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              AnimatedContainer(
                                duration:
                                    Duration(hours: 1), // Duración de una hora
                                width: 380 * sertalinaValue,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Paracetamol',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '2 pills left',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                width: 380,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              Container(
                                width: 380 * valsartanValue,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            height: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PatientsConfiguration()));
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
                'Configuration',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 10,
            height: 15,
            child: InkWell(
              onTap: () {
                // Mostrar ventana emergente con la alarma
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Pill ka boo!"),
                      content: Text("¡Es hora de tomar tus pastillas!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // Hacer el contenedor transparente
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: Colors.transparent), // Eliminar el borde
                ),
                child: Center(
                  child: Text(
                    'Alarm',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.transparent, // Hacer el texto transparente
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
