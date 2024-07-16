import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/translate.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  TranslaterController controller = Get.find<TranslaterController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Voice To Sign Language",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .025,
                          ),
                          Card(
                            child: TextFormField(
                              controller: controller.textt,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                              ),
                              onFieldSubmitted: (value) {
                                controller.WrittenMessage();
                              },
                            ),
                          ),
                          const Text(
                            "Type above or press the microphone and start speaking",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .25,
                    child: Obx(() => AvatarGlow(
                          endRadius: 45,
                          animate:
                              controller.isListerning.value == 0 ? false : true,
                          showTwoGlows: true,
                          repeatPauseDuration: const Duration(milliseconds: 100),
                          glowColor: Colors.deepPurple.shade300,
                          duration: const Duration(milliseconds: 2000),
                          child: FloatingActionButton.small(
                            shape: const CircleBorder(),
                            onPressed: () {},
                            child: GestureDetector(
                              onTapDown: (details) {
                                controller.ListernToUser();
                              },
                              onTapUp: (details) {
                                controller.stopListerning();
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  controller.isListerning.value == 1
                                      ? Icons.mic
                                      : Icons.mic_none,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
                height: size.height * .65,
                child: SingleChildScrollView(
                  child: GetBuilder<TranslaterController>(
                    builder: (Tc) {
                      return Wrap(
                        spacing: 0,
                        runSpacing: 8,
                        children: Tc.showsigns.map((sign) {
                          return Image.asset(
                            sign.values.first,
                            height: 100,
                            width: 100,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.WrittenMessage();
        },
        child: const Icon(Icons.translate),
      ),
    );
  }
}
