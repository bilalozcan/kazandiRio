import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/authenticate/register/register_view.dart';
import 'package:kazandirio/view/event/event_view_model.dart';
import 'package:kazandirio/view/live/live_view.dart';
import 'package:stacked/stacked.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventViewModel>.reactive(
        viewModelBuilder: () => EventViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white
                ),
                title: Text('Etkinlikler',style: TextStyle(
                    color: Colors.black
                ),),
                backgroundColor: Colors.white,
              ),
              body: StreamBuilder(
                stream: viewModel.firestoreService.getEventsStream(),
                builder: (context, dynamic sn) {

                  var data = [];
                  if (sn.hasData) {
                    data = sn.data.docs;
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return eventWidget(context, data.elementAt(index).data(),viewModel);
                      });
                },
              ));
        });
  }

  eventWidget(BuildContext context, Map<String, dynamic> data,EventViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 200,
          child: Stack(
            children: [
              Container(
                width: context.dynamicWidth(1),
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data['photo']), // insert image path here
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)), //divide width of Container by 2 to make it rounded
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                        Color(0xff0C2D83).withOpacity(0.3),
                        Colors.transparent,
                      ]), //change this color according to need.
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0C2D83),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10), topRight: Radius.circular(10)), //divide width of Container by 2 to make it rounded
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            data['title'],
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                        Color(0xff0C2D83),
                        Colors.transparent,
                      ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CountdownTimer(
                            endTime: (data['startDate'] as Timestamp).millisecondsSinceEpoch,
                            endWidget: Text('Etkinlik Başladı'),
                            widgetBuilder: (_, CurrentRemainingTime? time) {
                              if (time == null) {
                                return Text('Etkinlik Başladı');
                              }
                              return Text(
                                '${time.days??'0'} Gün ${time.hours!<10?'0${time.hours}':time.hours}:${time.min!<10?'0${time.min}':time.min}:${time.sec!<10?'0${time.sec}':time.sec}',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: AnimatedButton(
                  width: 75,
                  height: 35,
                  borderRadius: 10,
                  text: 'Giriş',
                  selectedTextColor: Colors.black,
                  selectedBackgroundColor: Colors.white,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  backgroundColor: Colors.white,
                  isSelected: false,
                  textStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                      color: Colors.black,
                      fontWeight: FontWeight.bold), onPress: () {
                    if(viewModel.baseData.user!=null)
                    context.navigateTo(LiveView(eventId: data['id'],));
                    else{
                      context.navigateTo(RegisterView());
                    }
                },
                ),
              )
            ],
          )),
    );
  }
}
