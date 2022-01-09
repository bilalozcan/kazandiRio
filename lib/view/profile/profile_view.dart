import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

import 'profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0xffEEEEEE),
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: CustomText('Profilim',
                  color: Colors.black87, fontWeight: FontWeight.w500),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 70,
              leadingWidth: context.dynamicWidth(0.09),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Color(0xff2751B8),
                  radius: 5,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    iconSize: 16,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Container(
                      height: context.dhExceptStatusBarAppBar(0.7),
                      child: Column(
                        children: [
                          CustomButton(
                            onPressed: () => viewModel.logout(),
                            backgroundColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app,
                                    color: Color(0xff0C2D83), size: 20),
                                SizedBox(width: context.dynamicWidth(0.01)),
                                CustomText('Oturumu Kapat',
                                    fontSize: 16, fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText('Sürüm: 1.90.0', color: Colors.grey, fontSize: 12,),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }

}
