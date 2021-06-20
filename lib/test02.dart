import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String? errorMessage;
  double toRon = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Currency convertor',
              style: TextStyle(
                color: Colors.black
            )
          ),
          backgroundColor: Colors.limeAccent,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Image.network('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.pVaO88icSvm179JW1d2DWQHaEK%26pid%3DApi&f=1'),

            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Introduce currency in EUR',
                errorText: errorMessage,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                suffix: IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: const Icon(Icons.clear)
                )

                )
              ),

            TextButton(
                child: const Text(
                  'Convert!',
                  style: TextStyle(
                    color: Colors.black,
                  )
                ),
                onPressed: () {
                  setState(() {
                    if(_controller.text.isEmpty) {
                      errorMessage = 'Enter a number.';
                    } else {
                      try {
                        toRon = double.parse(_controller.text) * 4.75;
                        errorMessage = null;
                      } catch (error) {
                        errorMessage = 'Enter a valid number';
                      }
                    }
                  });
                },
            ),
            Text(
              'Your currency is ' + toRon.toStringAsFixed(2) + ' RON',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black54
              )
            )
          ],
        )
      )
    );
  }
}
