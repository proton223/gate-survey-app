import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'ResultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageTemporary;
  bool showDetails = false;
  bool provisionCableLayout = false;
  bool provisionStorage = false;
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController parkingSpaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.all(10),
                  //add a rounded rectangle dashed border to the container, with an inkwell in the center
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                      //dashed border style
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: imageTemporary == null
                      ? InkWell(
                          onTap: () {
                            getImage();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera,
                                size: 50,
                                color: Colors.blue.shade600,
                              ),
                              Text(
                                'Click Photo',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade600,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Image.file(
                          imageTemporary!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              imageTemporary != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              imageTemporary = null;
                              getImage();
                              showDetails = false;
                            });
                          },
                          child: const Text('Recapture Image'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showDetails = true;
                            });
                          },
                          child: const Text('Continue with this image'),
                        ),
                      ],
                    )
                  : const SizedBox(),
              showDetails == true
                  ? Column(
                      children: [
                        const SizedBox(height: 5),
                        const Text(
                          'Enter the details of the image',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            controller: heightController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              labelText: 'Enter the height',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            onEditingComplete: () {
                              setState(() {
                                heightController.text = heightController.text;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            controller: widthController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              labelText: 'Enter the width',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            onEditingComplete: () {
                              setState(() {
                                widthController.text = widthController.text;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                            controller: parkingSpaceController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              labelText: 'Parking Space (in Sq. Mt.)',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            onEditingComplete: () {
                              setState(() {
                                parkingSpaceController.text =
                                    parkingSpaceController.text;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: provisionCableLayout,
                                onChanged: (bool? value) {
                                  setState(() {
                                    //bool provisionCableLayout is toggled
                                    provisionCableLayout = value!;
                                  });
                                },
                              ),
                              const Text('Provision for Cable Layout'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: provisionStorage,
                                onChanged: (bool? value) {
                                  setState(() {
                                    provisionStorage = value!;
                                  });
                                },
                              ),
                              const Text('Provision for Storage Space'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => const ResultPage(), arguments: {
                              'image': imageTemporary,
                              'height': heightController.text,
                              'width': widthController.text,
                              'parkingSpace': parkingSpaceController.text,
                              'provisionCableLayout': provisionCableLayout,
                              'provisionStorage': provisionStorage,
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade600,
                            foregroundColor: Colors.white,
                            elevation: 3,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Start Processing',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                        //implement checkbox in a row
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.acme().fontFamily,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'to the',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.acme().fontFamily,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Survey-Gate',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.acme().fontFamily,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      imageTemporary = File(image.path);
    });
  }
}
