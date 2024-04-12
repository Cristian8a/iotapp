import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  bool isConnected = false;

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
              height: 600,
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
                      'Configuration',
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
                                'Connect to device',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 20,
                                ),
                              ),
                              Switch(
                                value: isConnected, // Estado del switch
                                onChanged: (value) {
                                  setState(() {
                                    isConnected = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time periods',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 20,
                                ),
                              ),
                              DropdownButton<String>(
                                value: 'hours', // Valor inicial
                                onChanged: (newValue) {
                                  // Aquí puedes manejar el cambio de valor
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'hours',
                                    child: Text('hours'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'minutes',
                                    child: Text('minutes'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 20,
                                      ),
                                    ),
                                    Divider(
                                      height: 40,
                                    ),
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Exp: José',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                    Divider(
                                      height: 40,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Exp: jose@hotmail.com',
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 300,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                    content: Text("Configuration saved!"),
                                  ));
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue[900],
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Radio de los bordes
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
          ),
        ],
      ),
    );
  }
}
