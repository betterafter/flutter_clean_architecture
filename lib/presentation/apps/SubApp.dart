import 'package:flutter/cupertino.dart';

class SubApp extends StatelessWidget {
  final String name;
  const SubApp({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 200, height: 200, child: Text(name));
  }
}
