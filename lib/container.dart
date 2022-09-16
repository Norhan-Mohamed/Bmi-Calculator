import 'package:flutter/material.dart';

class Container_bottom extends StatelessWidget {
  Container_bottom(
      {Key? key,
      required this.label,
      required this.value,
      required this.onMinusPressed,
      required this.onPlusPressed})
      : super(key: key);
  String label;
  int value;
  void Function() onMinusPressed;
  void Function() onPlusPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff323244),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: Colors.white54, fontSize: 24),
                  ),
                  Text(
                    value.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white54,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onMinusPressed,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white54,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onPlusPressed,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
