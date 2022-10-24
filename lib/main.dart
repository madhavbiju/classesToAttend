import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'classesToAttend();',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'classesToAttend();'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int ctag;
  final TextEditingController _caController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  calculate() {
    int ca = int.parse(_caController.text);
    int oca = ca;
    int tc = int.parse(_tcController.text);
    ctag = 0;
    while ((ca / tc) * 100 < 75) {
      ca++;
      tc++;
    }
    int cta = ca - oca;
    ctag = cta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _caController,
                decoration: const InputDecoration(
                  labelText: "No of Classes Attended",
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _tcController,
                decoration: const InputDecoration(
                  labelText: " Total Number of Classes",
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    child: const Text('Calculate'),
                    onPressed: () => {
                          calculate(),
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('You Need to Attend'),
                              content: Text("$ctag more classes"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        })
              ],
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
