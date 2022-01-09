import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

import 'market_view_model.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketViewModel>.reactive(
        viewModelBuilder: () => MarketViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0xffEEEEEE),
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: CustomText('Market',
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(child: CustomText('295', color: Color(0xff2751B8), fontWeight: FontWeight.bold,)),
                )
              ],
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: ListView(
                  children: [
                    product('iPhone X 128 GB', '35000',
                        'https://productimages.hepsiburada.net/s/6/375/9713620123698.jpg'),
                    product('Tablet', '30000',
                        'https://cdn.cimri.io/image/1200x1200/appletabletpcfiyatlar_292591042.jpg'),
                    product('Ayakkabı', '3000',
                        'https://contents.mediadecathlon.com/p1845096/k\$12fcc9f726ea60519a0c24b970dd4af7'),
                    product('Hediye Çeki', '300',
                        'https://cdn.dsmcdn.com/mrktng/crm/staticPage/ty_wallet/17/imgs/mobil-wallet-bg.png'),
                  ],
                )),
          );
        });
  }

  Widget product(String productName, String point, String imageUrl) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(2, 3))]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.network(imageUrl),
              ),
              Expanded(
                child: CustomText(productName,
                    fontSize: 19, fontWeight: FontWeight.w500),
              ),
              CustomText(
                point,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff2751B8),
              )
            ],
          ),
        ),
      ),
    );
  }
}
