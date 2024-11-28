import 'package:flutter/material.dart';
import 'package:smart_dustbin/resources/AppText.dart';
import 'package:smart_dustbin/resources/appColor.dart';
import 'package:smart_dustbin/widgets/CustomCardWidget.dart';

class ControlDustbinPage extends StatefulWidget {
  String title;

  ControlDustbinPage({super.key, required this.title});

  @override
  State<ControlDustbinPage> createState() => _ControlDustbinPageState();
}

class _ControlDustbinPageState extends State<ControlDustbinPage> {
  double fullness = 0.2; // Initial trashcan fullness (20%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.mainColor,
        title: Text(
          "Control ${widget.title}",
          style: AppText.mainText,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          // White back arrow icon
          onPressed: () {
            Navigator.pop(context); // Pop back to the main screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 100,
                  height: 200,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.black, width: 3),
                      right: BorderSide(color: Colors.black, width: 3),
                      bottom: BorderSide(color: Colors.black, width: 3),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: 94,
                  height: 200 * fullness,
                  color: Colors.green.withOpacity(0.7),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    '${(fullness * 100).toInt()}%',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Open Dustbin',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Close Dustbin',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Increase the fullness percentage (max 100%)
                  fullness = (fullness + 0.1).clamp(0.0, 1.0);
                });
              },
              child: const Text('Increase Fullness'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Decrease the fullness percentage (min 0%)
                  fullness = (fullness - 0.1).clamp(0.0, 1.0);
                });
              },
              child: const Text('Decrease Fullness'),
            ),
          ],
        ),
      ),
    );
  }
}
