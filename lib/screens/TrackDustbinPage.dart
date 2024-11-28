import 'package:flutter/material.dart';
import 'package:smart_dustbin/screens/ControlDustbinPage.dart';
import '../resources/AppText.dart';
import '../resources/appColor.dart';

class TrackDustbinPage extends StatefulWidget {
  const TrackDustbinPage({super.key});

  @override
  State<TrackDustbinPage> createState() => _TrackDustbinPageState();
}

class _TrackDustbinPageState extends State<TrackDustbinPage> {
  List<String> dustbins = []; // List to hold dustbins
  int counter = 1;

  void _addDustbin() {
    setState(() {
      dustbins.add('Dustbin $counter');
      counter++;
    });
  }

  void _removeDustbin(int index) {
    setState(() {
      dustbins.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.mainColor,
        title: Text('Track Dustbins', style: AppText.mainText),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          // White back arrow icon
          onPressed: () {
            Navigator.pop(context); // Pop back to the main screen
          },
        ),
      ),
      body: ListView.builder(
          itemCount: dustbins.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ControlDustbinPage(title: dustbins[index])));
              },
              child: ListTile(
                  title: Text(
                    dustbins[index],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  subtitle: const Text("Status: Not Connected"),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _removeDustbin(index); // Remove item at this index
                      })),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDustbin,
        child: Icon(Icons.add),
        backgroundColor: appColor.mainColor,
      ),
    );
  }
}
