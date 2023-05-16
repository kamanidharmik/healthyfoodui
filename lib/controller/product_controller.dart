import 'package:get/get.dart';
import 'package:healthyfood/modal/productmodal.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  List<ProductModal> productlist = [];
  ProductModal productModal = ProductModal(
      id: "1",
      productname: "Soup",
      productimage: "assets/images/soup.jpg",
      productdescription: "It's Soup",
      productprice: "\$7.2",
      productrating: "4.2",
      productratecount: "18");

  ProductModal productModal1 = ProductModal(
      id: "1",
      productname: "Rosted Salmon",
      productimage: "assets/images/rosted.jpg",
      productdescription: "It's Rosted Salmon",
      productprice: "\$23.2",
      productrating: "5.0",
      productratecount: "6");

  ProductModal productModal2 = ProductModal(
      id: "1",
      productname: "Pizza",
      productimage: "assets/images/pizzabig.jpg",
      productdescription: "It's Pizza",
      productprice: "\$25.2",
      productrating: "5.0",
      productratecount: "100");
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    adddatatoList();
  }

  adddatatoList() {
    productlist.add(productModal1);
    productlist.add(productModal2);
    productlist.add(productModal);
    update();
  }
}
