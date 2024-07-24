import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_task/controller/api_controller.dart';

class ApiScreen extends StatelessWidget {
  ApiScreen({Key? key});

  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    final kData = apiController.apiData.value;

    //
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (apiController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.19),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    // width: 380,
                    child: ListView(
                      children: [
                        commonRow(
                            text: kData.n2.toString(),
                            imagePath: 'assets/images/yellow_card.png',
                            text1: kData.e.toString()),
                        commonRow(
                            text1: kData.e.toString(),
                            imagePath1: 'assets/images/red_card.png',
                            string: kData.n2.toString()),
                        commonRow(
                            text1: kData.e.toString(),
                            imagePath1: 'assets/images/football.png',
                            letter1: kData.n2.toString(),
                            letter2: kData.n1.toString()),
                        commonRow(
                            text1: kData.e.toString(),
                            images: 'assets/images/ht.png'),
                        commonRow(
                            text1: kData.e.toString(),
                            textStr1: kData.n1.toString(),
                            textStr2: kData.n2.toString(),
                            photo: 'assets/images/arrow.png'),
                        commonRow(
                            text1: kData.e.toString(),
                            imagePath1: 'assets/images/arrow.png',
                            letterString1: kData.n2.toString(),
                            letterString2: kData.n2.toString()),
                        commonRow(
                            text1: kData.e.toString(),
                            word: kData.n2.toString(),
                            imagePath: 'assets/images/football.png'),
                        commonRow(
                            text1: kData.e.toString(),
                            imagePath1: 'assets/images/arrow.png',
                            letterString1: kData.n2.toString(),
                            letterString2: kData.n2.toString()),
                        commonRow(
                            text1: kData.e.toString(),
                            imagePath1: 'assets/images/arrow.png',
                            letterString1: kData.n2.toString(),
                            letterString2: kData.n2.toString()),
                      ],
                    ),

                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: 9,
                    //   itemBuilder: (context, index) {
                    //     final kData = apiController.apiData.value;
                    //     log("n2--${kData.n2.toString()}");
                    //
                    //     return Column(
                    //       // mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Column(
                    //           children: [
                    //
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Center(child: Text(kData.n2.toString())),
                    //               ],
                    //               // title: Text(kData.n2.toString() ),
                    //               // Add other properties you want to display
                    //             ).paddingSymmetric(vertical: 30),
                    //             Divider(
                    //               height: 1,
                    //               color: Colors.black,
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     );
                    //   },
                    // ),
                  ).paddingSymmetric(horizontal: 16, vertical: 16);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget commonRow(
      {String? text,
      String? text1,
      String? imagePath,
      String? imagePath1,
      String? string,
      String? letter1,
      String? letter2,
      String? images,
      String? textStr1,
      String? textStr2,
      String? photo,
      String? letterString1,
      String? letterString2,
      String? word}) {
    return Column(
      children: [
        Row(
          children: [
            text != null
                ? const SizedBox(
                    width: 70,
                  )
                : const SizedBox(
                    width: 130,
                  ),
            Text(
              text ?? '',
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
            // SizedBox(width: 10,),
            Text(
              word ?? '',
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),

            Column(
              children: [
                Text(
                  textStr1 ?? '',
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
                Text(
                  textStr2 ?? '',
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ).paddingOnly(right: 0),
            const SizedBox(width: 15), // Add some space between text and image
            if (photo != null)
              Image.asset(
                photo ?? '',
                scale: 2.3,
              )
            else
              Container(
                width: 0,
              ),
            const SizedBox(width: 10), // Add some space between text and image
            if (imagePath != null)
              Image.asset(
                imagePath ?? '',
                scale: 2.3,
              )
            else
              Container(
                width: 0,
              ),

            // SizedBox(width: 25), // Add some space between text and image
            if (images != null)
              Image.asset(
                images ?? '',
                scale: 2.5,
              )
            else
              Container(),
            const SizedBox(width: 20),
            Text(
              text1 ?? '',
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.indigoAccent),
            ),
            const SizedBox(width: 25),
            if (imagePath1 != null)
              Image.asset(
                imagePath1 ?? '',
                scale: 2.3,
              )
            else
              Container(),
            const SizedBox(width: 20),
            Text(
              string ?? '',
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
            // SizedBox(width: 10),
            Column(
              children: [
                Text(
                  letter1 ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  letter2 ?? '',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  letterString1 ?? '',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
                Text(
                  letterString2 ?? '',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(vertical: 18.3),
        const Divider(
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
