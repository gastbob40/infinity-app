import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Flexible(
            child: PageView(
              children: <Widget>[
                Container(
                  color: Colors.orange,
                  child: Center(
                      child: Text(
                    'Page 1',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                      child: Text(
                    'Page 2',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                      child: Text(
                    'Page 3',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
