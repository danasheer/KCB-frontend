import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QrCode(),
    ));

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String _data = '';
  Future<String> _scan() async {
    return await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ButtonBar(alignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () async {
                  String data = await _scan();
                  setState(() {
                    _data = data;
                  });
                },
                child: Text("Scanner")),
            Text(_data)
          ]),
        ],
      ),
    );
  }
}
