import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Draggable01 extends StatefulWidget {
  const Draggable01({Key? key}) : super(key: key);

  @override
  State<Draggable01> createState() => _Draggable01State();
}

class _Draggable01State extends State<Draggable01> {
  Color caughtColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Draggable(
            data: Colors.orangeAccent,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orangeAccent,
              child: const Center(
                child: Text(
                  "Box",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            onDraggableCanceled: (velocity, offset) {},
            feedback: Container(
              width: 150,
              height: 150,
              color: Colors.orangeAccent.withOpacity(0.5),
              child: const Center(
                child: Text("Box"),
              ),
            ),
          ),
          DragTarget(onAccept: (Color color) {
            caughtColor = color;
          }, builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              width: 200,
              height: 200,
              color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
              child: const Center(
                child: Text("T E S T"),
              ),
            );
          }),
        ],
      ),
    );
  }
}
