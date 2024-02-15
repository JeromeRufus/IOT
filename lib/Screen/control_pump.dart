import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ControlPump extends StatefulWidget {
  const ControlPump({super.key});
  static const routeName = '/control';

  @override
  State<ControlPump> createState() => _ControlPumpState();
}

class _ControlPumpState extends State<ControlPump> {
  @override
  final CollectionReference relayCollection =
      FirebaseFirestore.instance.collection('relays');

  void toggleRelay(bool on) {
    relayCollection.doc('relay1').update({'state': on});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Pump'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: relayCollection.doc('relay').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            bool relayState = snapshot.data!['state'] ?? false;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => toggleRelay(!relayState),
                  child: Text(relayState ? 'Turn off' : 'Turn On'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
