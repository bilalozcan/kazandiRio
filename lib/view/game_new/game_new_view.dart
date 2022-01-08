import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kazandirio/view/game_new/game_new_view_model.dart';
import 'package:stacked/stacked.dart';

class GameNewView extends StatelessWidget {
  const GameNewView({Key? key,required this.rivalUserId}) : super(key: key);
  final String rivalUserId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameNewViewModel>.reactive(
        viewModelBuilder: () => GameNewViewModel(),
        onModelReady: (model)=>model.init(rivalUserId,'spor'),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.initialised?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Text(viewModel.question['title'],style: TextStyle(
                  color: Colors.black
                ),),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: viewModel.question['stylish'].length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = viewModel.question['stylish'].elementAt(index);
                        return InkWell(
                          onTap: (){

                          },
                          splashColor: HexColor('FFCC3D'),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: HexColor('666666'),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data['text'],style: TextStyle(
                                        color: Colors.white
                                      ),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ):Center(child: CircularProgressIndicator(),)
          );
        });
  }
}
