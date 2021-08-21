import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  int location = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.1),
                ),
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: location == index
                        ? Colors.amber
                        : Colors.amber.withOpacity(0.0),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        // Expanded(
        //   child: GridView.builder(
        //     itemCount: 10,
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 3),
        //     itemBuilder: (context, index) {
        //       return Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(color: Colors.black, width: 0.1),
        //         ),
        //         child: AnimatedContainer(
        //           curve: Curves.linear,
        //           duration: const Duration(seconds: 1),
        //           decoration: BoxDecoration(
        //             color: location == index
        //                 ? Colors.amber
        //                 : Colors.amber.withOpacity(0.0),
        //             shape: BoxShape.circle,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              location++;
            });
          },
          child: const Text('Jump'),
        ),
      ]),
    );
  }
}
