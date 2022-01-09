import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kazandirio/view/gift/gift_view_model.dart';
import 'package:stacked/stacked.dart';

class GiftView extends StatelessWidget {
  const GiftView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GiftViewModel>.reactive(
        viewModelBuilder: () => GiftViewModel(),
        onModelReady: (model)=>model.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: HexColor('D8D8D8'),
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white
              ),
              title: Text('Hediyeler',style: TextStyle(
                color: Colors.black
              ),),
              backgroundColor: Colors.white,
            ),
            body: viewModel.initialised?RefreshIndicator(
              onRefresh: ()async{
                viewModel.init();
              },
              child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: viewModel.gift.length,
          itemBuilder: (BuildContext context, int index) {
          return giftWidget(viewModel.gift.elementAt(index));
          }),
            ):Center(
              child: CircularProgressIndicator(),
            )
          );
        });
  }

  giftWidget(var data){
    return Container(
      height: 300,
      child: Column(
        children: [
          Text(data['title']),
          Row(
            children: [
              Image.network(
                data['photo'],
                height:100,
                width: 200,
              ),
              Column(
                children: [
                  Text('Puan :${data['point']}'),
                  Text('Son Tarih:12:12:2022')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
