import 'package:flutter/material.dart';

class DefultBody extends StatelessWidget {
  const DefultBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather start',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
