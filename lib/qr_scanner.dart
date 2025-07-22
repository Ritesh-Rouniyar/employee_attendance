import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        backgroundColor: const Color.fromARGB(255, 212, 91, 105),
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          facing: CameraFacing.back,
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (capture) {
          final barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (!_isScanned && barcode.rawValue != null) {
              setState(() => _isScanned = true);
              Navigator.pop(context, barcode.rawValue); // send result back
              break;
            }
          }
        },
      ),
    );
  }
}
