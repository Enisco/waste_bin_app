// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_bin_app/presentation/controller.dart';

class SmartWasteBinView extends StatefulWidget {
  const SmartWasteBinView({super.key});

  @override
  State<SmartWasteBinView> createState() => _SSmartWasteBinViewState();
}

class _SSmartWasteBinViewState extends State<SmartWasteBinView> {
  final controller = Get.put(SmartWasteBinController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Smart Waste Bin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<SmartWasteBinController>(
        init: SmartWasteBinController(),
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 400,
                      width: size.width * 0.6,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/waste-bin-removebg-preview.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 90)),
                        SizedBox(
                          height: 305,
                          width: 40,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 50,
                                  height: 305 *
                                      (100.0 -
                                          controller.percentageVal.toDouble() /
                                              100),
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 305 *
                                    (controller.percentageVal.toDouble() / 100),
                                color: Colors.red,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text('Filled'),
                    SizedBox(width: 30),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(width: 10),
                    Text('Available'),
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  'Bin fill level:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
                const SizedBox(height: 15),
                Text(
                  '${controller.percentageVal.toString()}%',
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
