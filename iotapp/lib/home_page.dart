import 'package:flutter/material.dart';
import 'package:iotapp/configuration.dart';
import 'package:iotapp/my_pills.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sertalinaValue = 0.5;
  double valsartanValue = 1;

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
                          Text(
                            'Sertalina',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                width: 380,
                                height: 10,
                                color: Colors.grey[300], // Color de fondo gris
                              ),
                              Container(
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
                          Text(
                            'Valsartán',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                width: 380,
                                height: 10,
                                color: Colors.grey[300], // Color de fondo gris
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyPills()));
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
                'My Pills',
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
