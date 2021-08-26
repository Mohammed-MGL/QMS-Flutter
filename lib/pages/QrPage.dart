import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Controllers/QRController.dart';

class QrPage extends StatefulWidget {
  QrPage({Key key}) : super(key: key);

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  bool isFlashOn = false;
  // QRController qrController = Get.find();

  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.09, end: 0.2),
                duration: Duration(seconds: 0, milliseconds: 450),
                builder: (_, scale, __) {
                  return QRView(
                    key: qrKey,
                    overlay: QrScannerOverlayShape(
                      borderRadius: 50,
                      borderColor: Theme.of(context).primaryColor,
                      cutOutBottomOffset: Get.height * .08,
                      borderLength: Get.width * scale,
                      borderWidth: 8,
                      cutOutSize: Get.width * .75,
                    ),
                    onQRViewCreated: _onQRViewCreated,
                  );
                }),
            Positioned(
              bottom: Get.height * .15,
              width: Get.width,
              child: Center(
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1.2),
                    duration: Duration(seconds: 0, milliseconds: 450),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                          color: Colors.blueGrey,
                          icon: Icon((!isFlashOn)
                              ? Icons.flash_on_rounded
                              : Icons.flash_off_rounded),
                          onPressed: () {
                            setState(() {
                              isFlashOn = !isFlashOn;
                              controller.toggleFlash();
                            });
                          }),
                    ),
                    builder: (_, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    }),
              ),
            ),
            Positioned(
              bottom: Get.height * .08,
              width: Get.width,
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                    child: Text(
                      "Position your phone so the QR code appears\nin the digital viewfinder",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * 0.9,
              child: Center(
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1.2),
                    duration: Duration(seconds: 0, milliseconds: 450),
                    child: IconButton(
                        color: Colors.white70,
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          Get.back();
                        }),
                    builder: (_, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        print("QR Scanned");
        // print(event.code);

        controller.pauseCamera();
        //controller.resumeCamera();
        
        // qrController.printCode(qrText);
      });

      Get.defaultDialog(
        title: "Searching",
        content: CircularProgressIndicator(),
        barrierDismissible: false,
      );
      // print(1);
      // print(Get.find<QRController>().val);
      Future.delayed(Duration(seconds: 10), () {
        print(2);
        print(Get.find<QRController>().val);
        if (Get.find<QRController>().val) {
          Get.back();
          Get.back();
          Get.defaultDialog(
            title: "T",
            content: Text('NoConnection'),
            barrierDismissible: true,
          );
        } else {
          Get.back();
          Get.back();
          Get.defaultDialog(
            title: "F",
            content: Text(''),
            barrierDismissible: true,
          );
        }
      });
      // print(3);
      // print(Get.find<QRController>().val);

      qrText = event.code;
      Get.find<QRController>().printCode(qrText);
    });
  }
}
