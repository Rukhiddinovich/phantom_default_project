import 'package:default_project/data/models/model.dart';
import 'package:default_project/local/db/local_database.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final dbHelper = LocalDatabase();

  bool isFlashOn = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void toggleFlashlight() {
    if (controller != null) {
      if (isFlashOn) {
        controller!.toggleFlash();
        setState(() {
          isFlashOn = false;
        });
      } else {
        controller!.toggleFlash();
        setState(() {
          isFlashOn = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: toggleFlashlight,
          child: Icon(Icons.flash_on, color: Colors.white, size: 25.r)),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Get Barcode",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          QRView(
            overlay: QrScannerOverlayShape(),
            key: qrKey,
            onQRViewCreated: (QRViewController controller) {
              this.controller = controller;
              controller.scannedDataStream.listen(
                (scanData) async {
                  this.controller = controller;
                  if (scanData.code != null) {
                    controller.stopCamera();

                    Navigator.pushNamed(context, RouteNames.addProduct,
                        arguments: scanData.code);
                  }
                },
              );
            },
          ),
          Center(child: Container())
        ],
      ),
    );
  }
  void CheckProduct(String qrCode,BuildContext context) async {
    final List<ShopModel> existingProducts =
    await LocalDatabase.getAllProducts();
    ShopModel? existingProduct;
    for (var product in existingProducts) {
      if (product.qrCode == qrCode) {
        existingProduct = product;
        break;
      }
    }
    if(existingProduct!= null && context.mounted){
      Navigator.pushNamed(context, RouteNames.addProduct, arguments: existingProduct);
    }else{
      Navigator.pushNamed(context, RouteNames.addProduct, arguments: qrCode);
    }
  }
}
