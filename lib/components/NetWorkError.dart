import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetWorkError extends StatelessWidget {
  final Function buttonHandler;

  const NetWorkError({Key key, this.buttonHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Container(
                    height: Get.height * 0.35,
                    child: Image(image: AssetImage('assets/images/networkError.png'))),
                Text(" Network Error :(",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 19.0)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(color:  Colors.grey[200],
                  child: InkWell(
                    child: Text(" Try Again ? ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    onTap: buttonHandler,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
