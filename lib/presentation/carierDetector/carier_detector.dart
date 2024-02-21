import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urdentist/presentation/authentication/screen/register.dart';
import 'package:urdentist/presentation/carierDetector/carier_controller.dart';
import 'package:urdentist/route/routes.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CarierController carierController = Get.put(CarierController());

  String jawab = "";
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Carier Detector',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add Complaints",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.045),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03)),
                    ),
                    child: TextFormField(
                      onChanged: (s) {
                        setState(() {
                          jawab = s;
                          carierController.text = s;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        hintText:
                            'please inform us of any other symptoms you may be experiencing...',
                        hintMaxLines: 2,
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: null,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade50.withOpacity(0.4),
                          ),
                          margin: EdgeInsets.only(right: width * 0.03),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/camera.png',
                                  width: width * 0.2,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Camera",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.045),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pickImageFromCamera();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade600,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade50.withOpacity(0.4),
                          ),
                          margin: EdgeInsets.only(left: width * 0.03),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/gallery.png',
                                  width: width * 0.2,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Gallery",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.045),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pickImageFromGallery();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade600,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  _selectedImage != null
                      ? ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.file(
                            _selectedImage!,
                            width: width * 0.4,
                          ))
                      : Text("Please selected an image"),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ))),
      floatingActionButton: Obx(() {
        return carierController.isLoading.value
            ? CircularProgressIndicator()
            : Container(
                width: width * 0.92,
                child: FloatingActionButton(
                  onPressed: () {
                    jawab != ""
                        ? carierController.carierDetector(_selectedImage!,
                            onSuccess: (res) {
                            carierController.persen.value = res.persen;
                            carierController.texts.value = res.text;
                            GoRouter.of(context).go(Routes.RESULT_SCREEN);
                          }, onFailed: (err) {
                            showMySnackbar(context, err);
                          })
                        : showMySnackbar(context, 'Add Complaint');
                  },
                  backgroundColor:
                      jawab != "" ? Colors.blue.shade600 : Colors.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color:
                              jawab != "" ? Colors.white : Colors.grey.shade600,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
      // carierController.myFile = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
      // carierController.myFile = File(returnedImage.path);
    });
  }
}
