import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  int location = 0;

  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  get circleSize => 100;
  get circle => Container(
        height: circleSize,
        width: circleSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
        ),
      );

  ////** Calculate Size

  get totalGrid => 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              location++;
              if (location >= totalGrid - 1) location = 0;
            });
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            controller: controller,
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxWidth / 3 * (totalGrid ~/ 3),
              color: Colors.cyanAccent.withOpacity(.2),
              child: Stack(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: totalGrid,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.1),
                        ),
                        child: const SizedBox(),
                      );
                    },
                  ),
                  AnimatedPositioned(
                    top: (location ~/ 3) * (constraints.maxWidth / 3) +
                        ((constraints.maxWidth / 6) - circleSize * .5),
                    left: (location % 3) * (constraints.maxWidth / 3) +
                        ((constraints.maxWidth / 6) - circleSize * .5),
                    child: circle,
                    duration: const Duration(milliseconds: 400),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
