import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controller/product_controller.dart';
import 'package:healthyfood/modal/categorymodal.dart';
import 'package:healthyfood/view/product_description_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categorylist = [
    Category("Salads", "assets/images/salad.png"),
    Category("Sushi", "assets/images/sushi.png"),
    Category("Pizza", "assets/images/pizza.png"),
    Category("Cakes", "assets/images/cake.png"),
    Category("Cold", "assets/images/cold.png"),
  ];

  final procontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.search, color: Colors.black),
                  trailing: Container(
                    width: 80,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.notifications_active,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset(
                            "assets/images/food.jpg",
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Text(
                  "Let's It Eat",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Healthy Food",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categorylist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                              //set border radius more than 50% of height and width to make circle
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      categorylist[index].icon,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(categorylist[index].name.toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "Popular Dishes",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(fontSize: 15, color: Colors.orange),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ProductController>(builder: (newController) {
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: procontroller.productlist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Image.asset(
                                    procontroller
                                        .productlist[index].productimage,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    String name = procontroller
                                        .productlist[index].productname
                                        .toString();
                                    String proimage = procontroller
                                        .productlist[index].productimage
                                        .toString();
                                    String rating = procontroller
                                        .productlist[index].productrating
                                        .toString();
                                    String ratingcount = procontroller
                                        .productlist[index].productratecount
                                        .toString();
                                    String details = procontroller
                                        .productlist[index].productdescription
                                        .toString();
                                    String price = procontroller
                                        .productlist[index].productprice
                                        .toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProDescScreen(
                                                  proimage: proimage,
                                                  name: name,
                                                  prodetails: details,
                                                  prorating: rating,
                                                  proratingcount: ratingcount,
                                                  price: price,
                                                )));
                                    // Get.to(ProDescScreen(),
                                    //     arguments: procontroller
                                    //         .productlist[index].productname
                                    //         .toString());
                                  },
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  procontroller.productlist[index].productname
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  procontroller
                                      .productlist[index].productdescription
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Card(
                                      color: Theme.of(context).cardColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          procontroller
                                              .productlist[index].productprice
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                        //set border radius more than 50% of height and width to make circle
                                      ),
                                      elevation: 5,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      procontroller
                                          .productlist[index].productrating
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "(${procontroller.productlist[index].productratecount.toString()})",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Discover New Places",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categorylist.length,
                      itemBuilder: (context, index) {
                        return CircleAvatar(
                          radius: 50,
                          child: Image.asset(
                            "assets/images/food.jpg",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
