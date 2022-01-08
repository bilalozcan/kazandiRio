import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:stacked/stacked.dart';

import 'leader_board_view_model.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LeaderBoardViewModel>.reactive(
        viewModelBuilder: () => LeaderBoardViewModel(),
        onModelReady: (model) => model.initialize(context),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xff0C2D83),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: context.dynamicHeight(0.4),
                        width: context.dynamicWidth(1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              overflow: Overflow.visible,
                              children: [
                                theFirstTree(
                                  context,
                                  '2',
                                  'assets/icon.png',
                                  context.dynamicHeight(0.12),
                                  'Full Name',
                                  // snapshot.data.length < 2 ? '-' : snapshot.data[1]['fullname'],
                                  'Point',
                                  // snapshot.data.length < 2 ? '-' : snapshot.data[1]['point'].toString(),

                                  FontAwesomeIcons.chevronUp,
                                  -context.dynamicHeight(0.24),
                                  -context.dynamicHeight(0.01),
                                  context.dynamicHeight(0.045),
                                ),
                                theFirstTree(
                                  context,
                                  '3',
                                  'assets/icon.png',
                                  context.dynamicHeight(0.12),
                                  'Full Name',
                                  //snapshot.data.length < 3 ? '-' : snapshot.data[2]['fullname'],
                                  'Point',
                                  //snapshot.data.length < 3 ? '-' : snapshot.data[2]['point'].toString(),

                                  FontAwesomeIcons.chevronDown,
                                  -context.dynamicHeight(0.01),
                                  -context.dynamicHeight(0.24),
                                  context.dynamicHeight(0.045),
                                ),
                                theFirstTree(
                                  context,
                                  '1',
                                  'assets/icon.png',
                                  context.dynamicHeight(0.16),

                                  'Full Name',
                                  //snapshot.data[0]['fullname'],
                                  'Point',
                                  //snapshot.data[0]['point'].toString(),
                                  FontAwesomeIcons.crown,
                                  -context.dynamicHeight(0.2),
                                  -context.dynamicHeight(0.2),
                                  -context.dynamicHeight(0.016),
                                ),
                                Positioned(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: 5,
                        // snapshot.data.length <= 3
                        //     ? 0
                        //     : snapshot.data.length > 50
                        //     ? 47
                        //     : snapshot.data.length - 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return listViewContainer(
                              context,
                              index,
                              'Full Name' /*snapshot.data[index + 3]['fullname']*/,
                              '100' /*snapshot.data[index + 3]['point'].toString()*/);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget theFirstTree(
      BuildContext context, number, imageUrl, size, username, point, icon,
      [positionLeft, positionRight, positionTop]) {
    return Positioned(
      left: positionLeft,
      top: positionTop,
      right: positionRight,
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
                color: Color(0xffEE6530), fontSize: 16, fontFamily: 'Poppins'),
          ),
          Icon(
            icon,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          imageWidget(imageUrl, size),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          nameAndPoint(username, point, context)
        ],
      ),
    );
  }

  Widget nameAndPoint(username, point, BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: context.dynamicWidth(0.17)),
          child: Text(
            username,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: context.dynamicWidth(0.034),
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ),
        Text(
          point,
          style: TextStyle(
              color: Colors.white,
              fontSize: context.dynamicWidth(0.04),
              fontFamily: 'Poppins'),
        ),
      ],
    );
  }

  Widget imageWidget(imageUrl, size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size + 5.0,
          height: size + 5.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size / 2)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: Image.asset(
            imageUrl,
            height: size,
          ),
        ),
      ],
    );
  }

  Widget listViewContainer(BuildContext context, int index, name, point) {
    return Container(
      width: context.dynamicWidth(1),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            listViewOrderHeader(index),
            SizedBox(
              width: 20,
            ),
            listViewInfoBody(context, name, point)
          ],
        ),
      ),
    );
  }

  Widget listViewOrderHeader(int index) {
    return Column(
      children: [
        Text(
          (index + 4).toString(),
          style:
              TextStyle(color: Colors.red, fontSize: 17, fontFamily: 'Poppins'),
        ),
        Icon(
          FontAwesomeIcons.chevronUp,
          size: 20,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget listViewInfoBody(BuildContext context, name, point) {
    return Container(
      height: 60,
      width: context.dynamicWidth(0.75),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/top-rated.png',
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white, fontSize: context.dynamicWidth(0.042)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              point,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
