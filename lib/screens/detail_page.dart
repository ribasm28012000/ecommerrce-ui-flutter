import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantDetailView extends StatefulWidget {
  final Map plantDetail;
  const PlantDetailView({super.key, required this.plantDetail});

  @override
  State<PlantDetailView> createState() => _PlantDetailViewState();
}

class _PlantDetailViewState extends State<PlantDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            widget.plantDetail["bottomContainerLabel"],
            style: const TextStyle(
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
    );
  }
}
