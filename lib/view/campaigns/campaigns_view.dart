import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/model/campaign.dart';
import 'package:kazandirio/view/authenticate/register/register_view.dart';
import 'package:kazandirio/view/campaign_detail/campaign_detail_view.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_progress_indicator.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:stacked/stacked.dart';

import 'campaigns_view_model.dart';

class CampaignsView extends StatelessWidget {
  const CampaignsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CampaignsViewModel>.reactive(
        viewModelBuilder: () => CampaignsViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0xffEEEEEE),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1.5,
              toolbarHeight: 70,
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('Merhaba,'),
                  CustomText(
                      '${BaseData.instance!.user != null ? BaseData.instance!.user!.fullName : 'KazandıRio\'lu'}',
                      fontWeight: FontWeight.w500)
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: CustomButton(
                    onPressed: () => viewModel.userButton(),
                    backgroundColor: Color(0xff2751B8),
                    width: BaseData.instance!.user != null
                        ? context.dynamicWidth(0.15)
                        : context.dynamicWidth(0.24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person),
                        if (BaseData.instance!.user == null)
                          CustomText('Giriş', color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('Kampanyalar',
                      fontSize: 24, fontWeight: FontWeight.bold),
                  SizedBox(height: context.dhExceptStatusBarAppBar(0.03)),
                  Container(
                    height: context.dhExceptStatusBarAppBar(0.7),
                    child: viewModel.isLoading
                        ? Center(child: CustomProgressIndicator())
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: viewModel.campaigns!
                                .map((campaign) =>
                                    CampaignsWidget(context, campaign))
                                .toList()),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget CampaignsWidget(BuildContext context, Campaign campaign) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: InkWell(
        onTap: () =>
            context.navigateTo(CampaignDetailView(campaignId: campaign.id!)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.dhExceptStatusBarAppBar(0.6),
              width: context.dynamicWidth(0.75),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(campaign.imageUrl!),
                      fit: BoxFit.fill)),
            ),
            Container(
              height: context.dhExceptStatusBarAppBar(0.1),
              width: context.dynamicWidth(0.75),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(campaign.name!, fontWeight: FontWeight.bold),
                    CustomText(
                      '${context.customFormatDate2(campaign.campaignStartDate)} - ${context.customFormatDate2(campaign.campaignEndDate)}',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
