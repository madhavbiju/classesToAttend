import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int ctag;
  int _sliderValue = 75;
  final TextEditingController _caController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Theme.of(context).shadowColor,
        title: Text('classesToAttend();'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _caController,
              decoration: const InputDecoration(
                labelText: "Number of Classes Attended",
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _tcController,
              decoration: const InputDecoration(
                labelText: "Total Number of Classes",
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Percentage Required: $_sliderValue',
          ),
          SizedBox(height: 30.0),
          Slider(
            value: _sliderValue.toDouble(),
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: _sliderValue.toString(),
            onChanged: (double value) {
              setState(() {
                _sliderValue = value.toInt();
              });
            },
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                  ),
                  child: const Text('Calculate'),
                  onPressed: () => {
                        calculate(),
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title:
                                Text("You need to attend \n$ctag more classes"),
                            actions: <Widget>[
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
      ),
    );
  }

  calculate() {
    int ca = int.parse(_caController.text);
    int oca = ca;
    int tc = int.parse(_tcController.text);
    ctag = 0;
    while ((ca / tc) * 100 < _sliderValue) {
      ca++;
      tc++;
    }
    int cta = ca - oca;
    ctag = cta;
  }
}
