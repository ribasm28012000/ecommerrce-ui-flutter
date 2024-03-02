import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../controllers/navigation_controller.dart';
import '../utils/strings.dart';
import '../widgets/common_widgets.dart';
import '../widgets/drawers.dart';
import 'card.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List plantCategories = [
    {
      "icon": "assets/svg/outdoor_category.svg",
      "label": Strings.outdoorCategoryLabelText
    },
    {
      "icon": "assets/svg/indoor_category.svg",
      "label": Strings.indoorCategoryLabelText
    },
    {
      "icon": "assets/svg/accessories_category.svg",
      "label": Strings.accesoryCategoryLabelText
    },
    {
      "icon": "assets/svg/other_category.svg",
      "label": Strings.otherCategoryLabelText
    },
  ];

  List popularPlants = [
    {
      "leadingLabel": "Outdoor Plant",
      "leadingColor": Colors.green,
      "plantImage": "assets/svg/outdoor_category.svg",
      "bottomContainerLabel": "Round Cactus",
      "plantAmount": "21.9",
    },
    {
      "leadingLabel": "Indoor Plant",
      "leadingColor": Colors.orange,
      "plantImage": "assets/svg/indoor_category.svg",
      "bottomContainerLabel": "Monstera Plant",
      "plantAmount": "18.5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            child: IconButton(
                onPressed: () {
                  openDrawer();
                },
                icon: const Icon(Icons.menu_sharp, size: 30))),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25, top: 10),
            child: IconButton(
                onPressed: () {
                  contextConnectwithRoute(context, const CheckOutScreen());
                },
                icon: SvgPicture.asset(
                  'assets/svg/cart_outline.svg',
                  height: 20,
                  width: 20,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  Strings.homePageAppbarLabel,
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey.shade200,
                    shape: BoxShape.rectangle),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/svg/search.svg'),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: const TextField(
                            decoration: InputDecoration(
                          hintText: Strings.searchHintText,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                        ))),
                    SvgPicture.asset('assets/svg/barcode.svg')
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  Strings.homepageSubMenuCategory,
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: plantCategories
                        .map((category) => CategoryContainer(
                            labelText: category["label"],
                            iconData: category["icon"]))
                        .toList()),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  Strings.homepageSubMenuPopular,
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: popularPlants.map((plant) {
                        var index = popularPlants.indexOf(plant);
                        return GestureDetector(
                          onTap: () {
                            // contextConnectwithRoute(
                            //     context, const PlantDetailView());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: PopularPlantContainer(
                                popularContainerData: plant,
                                addCartClick: () {
                                  contextConnectwithRoute(
                                      context,
                                      PlantDetailView(
                                        plantDetail: plant,
                                      ));
                                  debugPrint(index.toString());
                                  debugPrint(plant["bottomContainerLabel"]);
                                }),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
