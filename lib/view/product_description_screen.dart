// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:healthyfood/controller/product_controller.dart';

class ProDescScreen extends StatefulWidget {
  // dynamic argumendata = Get.arguments;
  String name;
  String proimage;
  String prodetails;
  String prorating;
  String proratingcount;
  String price;

  ProDescScreen({
    Key? key,
    required this.name,
    required this.proimage,
    required this.prodetails,
    required this.prorating,
    required this.proratingcount,
    required this.price,
  }) : super(key: key);

  @override
  State<ProDescScreen> createState() => _ProDescScreenState();
}

class _ProDescScreenState extends State<ProDescScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.argumendata['name'].toString());
    print(widget.name);
    // print(widget.argumendata[0]['name'].toString());
  }

  final productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.topCenter,
              height: 350.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(30, 8),
                  bottomRight: Radius.elliptical(30, 8),
                ),
              ),
              child: Image.asset(widget.proimage, fit: BoxFit.contain),
            ),
            Container(
              padding: EdgeInsets.only(top: 350, left: 10, right: 55),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        widget.prorating,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(${widget.proratingcount})",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        "350 calories",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Details",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.prodetails,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/food.jpg",
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 70, 70, 74),
                        child: IconButton(
                            color: Colors.green,
                            onPressed: () {
                              productcontroller.quantity =
                                  productcontroller.quantity - 1;
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(() {
                        return Text(productcontroller.quantity.toString());
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 70, 70, 74),
                        child: IconButton(
                            color: Colors.green,
                            onPressed: () {
                              productcontroller.quantity =
                                  productcontroller.quantity + 1;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.green)))),
                          onPressed: () {},
                          child: Text("Order For ${widget.price}"))
                    ],
                  )
                ],
              ),
            )
          ])
        ]),
      ),
    );
  }
}
