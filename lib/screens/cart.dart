import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horticulture_management/controllers/decimal_controller.dart';
import 'package:horticulture_management/widgets/buttons.dart';
import 'package:horticulture_management/widgets/common_widgets.dart';

import '../utils/strings.dart';

class CheckOutScreen extends StatefulWidget {
  final List cartContainerData;
  const CheckOutScreen({super.key, required this.cartContainerData});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  double totalAmount = 0.00;
  double discountAmount = 0.00;
  double totalChargeAmount = 0.00;
  List cartItems = [
    {
      "leadingLabel": "Outdoor Plant",
      "leadingColor": Colors.green,
      "plantImage": "assets/svg/outdoor_category.svg",
      "bottomContainerLabel": "Round Cactus",
      "plantAmount": 21.92,
      "count": 8
    },
    {
      "leadingLabel": "Indoor Plant",
      "leadingColor": Colors.orange,
      "plantImage": "assets/svg/indoor_category.svg",
      "bottomContainerLabel": "Monstera Plant",
      "plantAmount": 18.51,
      "count": 7
    },
  ];
  @override
  void initState() {
    super.initState();
    getTotalAmount();
  }

  getTotalAmount() {
    setState(() {
      totalAmount = 0.00;
    });
    for (var item in cartItems) {
      if (item["count"] > 0) {
        setState(() {
          totalAmount = totalAmount + item["plantAmount"] * item["count"];
        });
      }
    }
  }

  String getTotalCharge() {
    setState(() {
      discountAmount = totalAmount * 5 / 100;
      totalChargeAmount = totalAmount - discountAmount;
    });
    return totalChargeAmount.toString();
  }

  String getDiscountAmount() {
    setState(() {
      discountAmount = totalAmount * 5 / 100;
    });
    return discountAmount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.985),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Checkout",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
        ),
        titleSpacing: 10,
        leading: Container(
          margin: const EdgeInsets.only(left: 15, top: 10),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/svg/arrow_back.svg',
                height: 20,
                width: 20,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  Strings.homepageSubMenuCartItems,
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: cartItems.map((item) {
                        var cartIndex = cartItems.indexOf(item);
                        return CartItemContainer(
                          cartContainerData: item,
                          countCart: item["count"].toString(),
                          negativeClick: () {
                            if (cartItems[cartIndex]["count"] > 0) {
                              setState(() {
                                cartItems[cartIndex]["count"] =
                                    cartItems[cartIndex]["count"] - 1;
                              });
                              getTotalAmount();
                            }
                          },
                          positiveClick: () {
                            setState(() {
                              cartItems[cartIndex]["count"] =
                                  cartItems[cartIndex]["count"] + 1;
                            });
                            getTotalAmount();
                          },
                        );
                      }).toList(),
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  Strings.homepageSubMenuOrderSummary,
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          Strings.itemDetailText,
                          style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                        ),
                        Text(
                          "\$ ${formatDecimalValue(totalAmount.toString())}",
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          Strings.itemDiscountText,
                          style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                        ),
                        Text(
                          "\$ ${formatDecimalValue(getDiscountAmount())}",
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          Strings.totalChargeText,
                          style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                        ),
                        Text(
                          "\$ ${formatDecimalValue(getTotalCharge())}",
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomMainButton(
                  buttonText: "Pay Now",
                  onClick: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
