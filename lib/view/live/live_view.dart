import 'package:bubble/bubble.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kazandirio/view/live/live_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:kazandirio/core/extension/context_extension.dart';

class LiveView extends StatelessWidget {
  const LiveView({Key? key, required this.eventId}) : super(key: key);
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LiveViewModel>.reactive(
        viewModelBuilder: () => LiveViewModel(),
        onModelReady: (model)=>model.init(eventId),
        builder: (context, viewModel, child) {
        viewModel.userEventAddFunc();
          return WillPopScope(
            onWillPop: () async{
              viewModel.userEventDeleteFunc();
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Color(0xff0C2D83),
                  body: Stack(
                    children: [
                      Center(child: Image.asset('assets/icon.png',)),
                      Column(
                        children: [
                          Expanded(
                            child: StreamBuilder(
                              stream: viewModel.firestoreService.getLivesStream(eventId),
                              builder: (context, dynamic sn) {
                                var data = [];
                                if (sn.hasData) {
                                  data = sn.data.docs;
                                  viewModel.scrollController.jumpTo(0);
                                }
                                return ListView.builder(
                                  controller: viewModel.scrollController,
                                    padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
                                    itemCount: data.length,
                                    reverse: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      if(data.elementAt(index)['senderId']=='1'){
                                        return myGetCodeWidget(data.elementAt(index), context);
                                      }
                                      else{
                                        return getCodeWidget(data.elementAt(index), context);
                                      }
                                    });
                              },
                            ),
                          ),
                         FutureBuilder(
                             future:viewModel.getUserCode() ,
                             builder: (context,dynamic snCode){
                           var codeList = <Code>[];
                           if(snCode.data!=null)
                             codeList = snCode.data;

                           return codeList.isNotEmpty? DropdownSearch<Code>(
                             dropdownSearchBaseStyle: TextStyle(color: Colors.white),
                             dropDownButton: Container(),
                             dropdownButtonBuilder: (context) {
                               return Material(
                                 color: Colors.white,
                                 child: Container(
                                   color: Colors.white,
                                   height: 45,
                                 ),
                               );
                             },
                             dropdownBuilder: (context, Code? code) {
                               return Container(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                      code!=null?code.code.toString(): 'Kod Giriniz',
                                       style: TextStyle(
                                         fontSize: 17,
                                         fontWeight: FontWeight.bold,
                                         letterSpacing: 1.1,
                                         color: Colors.white,
                                       ),
                                     ),
                                     GestureDetector(
                                       onTap: () {
                                         if(code!=null&&code.id!=''){
                                           Map<String, dynamic> map = {
                                             'code':code.code,
                                             'date':DateTime.now(),
                                             'point':5,
                                             'userColor':'98D930',
                                             'senderId':'1',
                                             'userPhoto':'https://i.imgur.com/BoN9kdC.png',
                                             'username':'mehmet'
                                           };
                                          viewModel.addMeesage(map, code.id!);
                                         }
                                       },
                                       child: Padding(
                                         padding: const EdgeInsets.only(right: 8),
                                         child: Icon(
                                           Icons.send,
                                           size: 30,
                                           color: Colors.white,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             },
                             popupItemBuilder: (context,code,bool){
                               return Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   height: 50,
                                   decoration: BoxDecoration(
                                     color: HexColor('507CC0'),
                                     borderRadius: BorderRadius.all(Radius.circular(10))
                                   ),

                                   padding: EdgeInsets.only(left: 20),
                                   alignment: Alignment.centerLeft,
                                   child: Text('-> '+code.code!,style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.w700,
                                     fontSize: 18,
                                     letterSpacing: 2
                                   ),),
                                 ),
                               );
                             },
                             popupShape:RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(20.0),
                                 topLeft: Radius.circular(20.0)
                               ),
                             ),
                             mode: Mode.BOTTOM_SHEET,
                             items: codeList,
                             hint: "Kod seçiniz",
                             onChanged: print,
                           ):Container();
                         })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              viewModel.userEventDeleteFunc();
                              context.pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.close,color: Colors.black,)
                              ),
                            ),
                          ),
                          StreamBuilder(
                            stream: viewModel.firestoreService.getLivesUserStream(eventId),
                            builder: (context, dynamic sn) {
                              var data = [];
                              if (sn.hasData) {
                                data = sn.data.docs;
                                viewModel.scrollController.jumpTo(0);
                              }
                              return Padding(
                                padding: const EdgeInsets.only(right: 8,top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: HexColor('#CE442C'),
                                          shape: BoxShape.circle
                                      ),
                                      child: Text(
                                        '${data.length}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  getCodeWidget(var data, BuildContext context) {
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      elevation: 1,
      alignment: Alignment.topLeft,
      nip: BubbleNip.leftTop,
      color: HexColor('#D8D8D8').withOpacity(0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(data['username'],overflow: TextOverflow.ellipsis,style: TextStyle(
              color: HexColor("#${data['userColor']}"),
              fontWeight: FontWeight.w700,
              fontSize: 15
          ),),
          Text(data['code'],style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1
          ),),
        ],
      ),
    );
  }
  myGetCodeWidget(var data, BuildContext context) {
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      elevation: 1,
      alignment: Alignment.bottomRight,
      nip: BubbleNip.rightBottom,
      color: HexColor('2885BB'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['code'],style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1
          ),),
        ],
      ),
    );
  }
}
