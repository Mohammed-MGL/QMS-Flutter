import 'package:get/get.dart';

class QRController extends GetxController {

  bool val = false;
  var qrText = "";

  void printCode(String code) {
    // val = !val ;
    update();
    print("the code is : $code");
  }
}
