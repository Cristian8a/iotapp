import 'package:flutter/material.dart';
import 'package:iotapp/DoctorView/configuration.dart';
import 'package:iotapp/DoctorView/my_patients.dart';
// import 'package:iotapp/DoctorView/my_pills.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  State<DoctorHomePage> createState() => DoctorHomePageState();
}

class DoctorHomePageState extends State<DoctorHomePage> {
  List<String> patientName = [
    "Julie Sainz", // Nombre del paciente (puedes cambiarlo según necesites)
    // "Morri Doe", // Nombre del paciente (puedes cambiarlo según necesites)
  ];
  String avatarImageUrl =
      "https://example.com/avatar.jpg"; // URL de la imagen del avatar del paciente (puedes cambiarlo según necesites)

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
              height:
                  150, // Reducimos la altura para que quepa en una sola línea
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.white, width: 2.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(avatarImageUrl),
                        radius: 40, // Tamaño del avatar
                      ),
                      SizedBox(
                          width: 20), // Espacio entre el avatar y el nombre
                      Text(
                        'Name: ${patientName}',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyPatients()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[900],
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Radio de los bordes
                ),
              ),
              child: Text(
                'My Patients',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Configuration()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[900],
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Radio de los bordes
                ),
              ),
              child: Text(
                'Configuration',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
