import 'package:flutter/material.dart';
import 'package:iotapp/my_pills_edit.dart';
import 'package:iotapp/providers/pills_provider.dart';
import 'package:provider/provider.dart';

class MyPills extends StatelessWidget {
  const MyPills({Key? key});

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
              height: 500,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.white, width: 2.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Julies pills',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Construir una lista de píldoras desde DataProvider
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: dataProvider.pills.length,
                        itemBuilder: (context, index) {
                          PillsProvider pill = dataProvider.pills[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    pill.name,
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      // Navegar a la pantalla de edición de píldoras
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => MyPillsEdit(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'Each',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    ' ${pill.interval} ',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'hours!',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 300,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text("Just added new Pills..."),
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
                            'Add new pills',
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
        ],
      ),
    );
  }
}
