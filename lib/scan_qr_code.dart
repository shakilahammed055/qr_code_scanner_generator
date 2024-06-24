import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned Data Will appear here';

  Future<void>scanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "cancel", true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult= qrCode.toString();
      });
    }on PlatformException{
      qrResult="Fail to read qr code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Qr Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text("$qrResult",style: TextStyle(color: Colors.black),),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: scanQR,
                child: Text("Scan Code"),
            )
          ],
        ),
      ),
    );
  }
}
