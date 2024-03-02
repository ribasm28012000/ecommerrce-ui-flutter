import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horticulture_management/utils/colors.dart';
import 'package:horticulture_management/widgets/buttons.dart';

class CategoryContainer extends StatelessWidget {
  final String labelText;
  final String iconData;
  const CategoryContainer(
      {super.key, required this.labelText, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                iconData,
                width: 25,
                height: 25,
              ),
            ],
          ),
        ),
        Text(
          labelText,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class PopularPlantContainer extends StatelessWidget {
  final Map popularContainerData;
  final VoidCallback addCartClick;
  const PopularPlantContainer(
      {super.key,
      required this.popularContainerData,
      required this.addCartClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          PopularPlantLeadingContainer(
              labelText: popularContainerData["leadingLabel"],
              labelColor: popularContainerData["leadingColor"]),
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              popularContainerData["plantImage"],
              height: 130,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PopularPlantBottomContainer(
                carkClick: addCartClick,
                plantName: popularContainerData["bottomContainerLabel"],
                amount: popularContainerData["plantAmount"]),
          )
        ],
      ),
    );
  }
}

class PopularPlantLeadingContainer extends StatelessWidget {
  final String labelText;
  final Color labelColor;
  const PopularPlantLeadingContainer(
      {super.key, required this.labelText, required this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      alignment: Alignment.topLeft,
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: labelColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              labelText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}

class PopularPlantBottomContainer extends StatelessWidget {
  final String plantName;
  final String amount;
  final VoidCallback carkClick;
  const PopularPlantBottomContainer(
      {super.key,
      required this.plantName,
      required this.amount,
      required this.carkClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      width: 220,
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10, top: 8),
                  child: Text(
                    plantName,
                    style: const TextStyle(fontSize: 14, fontFamily: "Poppins"),
                  )),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  "\$ $amount",
                  style: const TextStyle(fontSize: 22, fontFamily: "Poppins"),
                ),
              ),
              GestureDetector(
                onTap: carkClick,
                child: Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(left: 110, bottom: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Add to Cart",
                        style: TextStyle(color: ColorStatic.primaryButtonColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset('assets/svg/right_arrow.svg')
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemContainer extends StatefulWidget {
  final Map cartContainerData;
  final VoidCallback negativeClick;
  final VoidCallback positiveClick;
  final String countCart;

  const CartItemContainer(
      {super.key,
      required this.cartContainerData,
      required this.negativeClick,
      required this.positiveClick,
      required this.countCart});

  @override
  State<CartItemContainer> createState() => _CartItemContainerState();
}

class _CartItemContainerState extends State<CartItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 105,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 90,
            width: MediaQuery.of(context).size.width * 0.20,
            child: Center(
                child: SvgPicture.asset(
              widget.cartContainerData["plantImage"],
              height: 50,
              width: 50,
            )),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 90,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 10, top: 8),
                    child: Text(
                      widget.cartContainerData["bottomContainerLabel"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    "\$ ${widget.cartContainerData["plantAmount"]}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 90,
            width: MediaQuery.of(context).size.width * 0.20,
            child: Center(
              child: Row(children: [
                CustomButton(
                    buttonIcon: 'assets/svg/negative_button.svg',
                    onTap: widget.negativeClick),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  height: 20,
                  width: 20,
                  child: Center(child: Text(widget.countCart)),
                ),
                CustomButton(
                    buttonIcon: 'assets/svg/positive_button.svg',
                    onTap: widget.positiveClick)
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
