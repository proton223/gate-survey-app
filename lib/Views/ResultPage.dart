import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the Get.to arguments passed to this page
    final args = Get.arguments[0];
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Get.arguments != null
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                            //dashed border style
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FloatingDraggableWidget(
                          floatingWidgetHeight: 150,
                          floatingWidgetWidth: 300,
                          mainScreenWidget: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Image.file(
                              Get.arguments['image'],
                              fit: BoxFit.cover,
                              opacity: const AlwaysStoppedAnimation(.5),
                            ),
                          ),
                          floatingWidget: Image.asset(
                            'assets/gate.png',
                            fit: BoxFit.cover,
                          ),
                        ))
                    : const Center(
                        child: Text('No Image Captured'),
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  const Text('Recommended Gate Type for the surveyed site is: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Sliding Gate',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('Dimensions of the Suggested Gate',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '${Get.arguments['width']}ft x ${Get.arguments['height']}ft',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Provision for Laying Cable: ${Get.arguments['provisionCableLayout']} ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Get.arguments['provisionCableLayout'] ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    'Provision for Storage: ${Get.arguments['provisionStorage']}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Get.arguments['provisionStorage'] ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
