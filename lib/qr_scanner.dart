import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool _isScanned = false;
  bool _permissionsGranted = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // Request camera permission
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      cameraStatus = await Permission.camera.request();
    }

    // Request location permission
    var locationStatus = await Permission.locationWhenInUse.status;
    if (!locationStatus.isGranted) {
      locationStatus = await Permission.locationWhenInUse.request();
    }

    if (cameraStatus.isGranted && locationStatus.isGranted) {
      setState(() {
        _permissionsGranted = true;
      });
    } else {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Permissions required'),
        content: const Text(
            'Camera and location permissions are required to scan QR codes and get location. Please enable them in settings.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop(); // back to welcome page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Show dialog asking user to enable location services
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Enable Location'),
          content: const Text(
              'Location services are disabled. Please enable location services to get your current location.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );

      // Open location settings so user can enable it
      await Geolocator.openLocationSettings();

      // Throw error so the caller can handle
      return Future.error('Location services are disabled.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_permissionsGranted) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner'),
          backgroundColor: const Color.fromARGB(255, 212, 91, 105),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
        onDetect: (capture) async {
          final barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (!_isScanned && barcode.rawValue != null) {
              setState(() => _isScanned = true);
              final scannedText = barcode.rawValue!;
              try {
                final position = await _getCurrentLocation();
                Navigator.pop(context, {
                  'scannedText': scannedText,
                  'latitude': position.latitude,
                  'longitude': position.longitude,
                });
              } catch (e) {
                Navigator.pop(context, {
                  'scannedText': scannedText,
                  'latitude': 'Location service disabled',
                  'longitude': 'Location service disabled',
                });
              }
              break;
            }
          }
        },
      ),
    );
  }
}
