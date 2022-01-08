import 'package:flutter/src/widgets/framework.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/model/campaign.dart';
import 'package:kazandirio/service/campaign_service.dart';
import 'package:kazandirio/view/authenticate/register/register_view.dart';

class CampaignsViewModel extends CustomBaseViewModel {
  List<Campaign>? campaigns;

  @override
  void initialize(BuildContext context) async {
    this.context = context;
    await getCampaigns();
  }

  Future getCampaigns() async {
    isLoading = true;
    var result = await CampaignService.instance!.getCampaigns();
    if (result != null) {
      campaigns = result;
    } else {
      campaigns = [];
    }
    isLoading = false;
  }

  void userButton() {
    if (BaseData.instance!.user != null) {
    } else {
      context.navigateTo(RegisterView());
    }
  }
}
