import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_progress_indicator.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_html/flutter_html.dart';

import 'campaign_detail_view_model.dart';

class CampaignDetailView extends StatelessWidget {
  final String campaignId;

  const CampaignDetailView({Key? key, required this.campaignId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CampaignDetailViewModel>.reactive(
        viewModelBuilder: () => CampaignDetailViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context, campaignId),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              body: viewModel.isLoading
                  ? Center(child: CustomProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: context.dhExceptStatusBar(1),
                          child: Stack(
                            children: [
                              ListView(
                                children: [
                                  Image.network(
                                      viewModel.campaign!.detailImageUrl!),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: CustomText(
                                      viewModel.campaign!.name!,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today,
                                            color: Color(0xff2751B8)),
                                        SizedBox(
                                            width: context.dynamicWidth(0.01)),
                                        CustomText(
                                          '${context.customFormatDate2(viewModel.campaign!.campaignStartDate)} - ${context.customFormatDate2(viewModel.campaign!.campaignEndDate)}',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    height:
                                        context.dhExceptStatusBarAppBar(0.065),
                                    width: context.dynamicWidth(1),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 0.3, color: Colors.grey),
                                          bottom: BorderSide(
                                              width: 0.3, color: Colors.grey)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Icon(Icons.location_on,
                                              color: Color(0xff2751B8)),
                                          CustomText(
                                              'Kampanya Noktalarını Görüntüle',
                                              fontSize: 14)
                                        ]),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Html(data: viewModel.campaign!.descriptionHeader!,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Html(data: viewModel.campaign!.descriptionBody!),
                                  )
                                ],
                              ),
                              Positioned(
                                top: context.dhExceptStatusBar(0.02),
                                right: context.dhExceptStatusBar(0.02),
                                child: CircleAvatar(
                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => context.pop(),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: context.dynamicWidth(1),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: context.dhExceptStatusBar(0.04),
                                              width: context.dynamicWidth(1),
                                              color: Colors.red.withOpacity(0)),
                                          Container(
                                              height: context.dhExceptStatusBar(0.06),
                                              width: context.dynamicWidth(1),
                                              color: Colors.white),
                                        ],
                                      ),
                                      Center(
                                        child: CustomButton(
                                          width: context.dynamicWidth(0.9),
                                          onPressed: () {},
                                          text: 'Şifreyi Okut, Hemen Katıl',
                                          textColor: Colors.white,
                                          backgroundColor: Color(0xff2751B8),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
            ),
          );
        });
  }
}
