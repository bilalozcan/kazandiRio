import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/event/event_view_model.dart';
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
                title: Text('Etkinlikler'),
              ),
              body:StreamBuilder(
                stream:viewModel.firestoreService.getEventsStream() ,
                builder: (context,sn){
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return eventWidget(context);
                      }
                  );
                },
              )
          );
        });

  }
  eventWidget(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xff0C2D83)
        ),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Etkinlik Başlığı',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
