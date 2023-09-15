import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZE'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("company Name"),
            TextFormField(
              controller: controller.companyName,
            ),
            const Text("company Address"),
            TextFormField(controller: controller.companyAddress),
            const Text("GSTIN"),
            TextFormField(controller: controller.companyGstin),
            ElevatedButton(
                onPressed: () {
                  controller.generatePDF();
                },
                child: const Text('Genrate Bill')),
            Obx(() {
              return controller.path.value == ''
                  ? Container()
                  : SizedBox(
                      height: 600,
                      child: SfPdfViewer.file(
                          File("${controller.path.value}/Invoice.pdf")));
            })
          ],
        ),
      ),
    );
  }
}
