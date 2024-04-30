import 'package:flutter/material.dart';
import 'package:iotapp/DoctorView/my_pills.dart'; // Importa la pantalla MyPills aquí

class MyPatients extends StatefulWidget {
  @override
  State<MyPatients> createState() => _PatientsHomePageState();
}

class _PatientsHomePageState extends State<MyPatients> {
  List<String> patientNames = [
    "Julie Sainz",
    "Morri Doe",
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
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: ListView.builder(
                  itemCount: patientNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navegar a la pantalla MyPills cuando se selecciona un paciente
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MyPills()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              avatarImageUrl), // URL de la imagen del avatar del paciente
                        ),
                        title: Text(
                          'Name: ${patientNames[index]}',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
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
                // Agregar un nuevo paciente
                setState(() {
                  patientNames.add("New Patient");
                });
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
                'Add Patient',
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
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text("Patients saved!"),
                  ));
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
    );
  }
}
