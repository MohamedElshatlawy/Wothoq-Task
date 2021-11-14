import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_listTile.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/viewModel/locale/localizationProvider.dart';
import 'package:v_room_app/viewModel/product_provider.dart';

class CustomTabs extends ConsumerWidget {
  const CustomTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var viewProductProvider = watch(productProvider);
    var locProvider = watch(localProvider);

    return DefaultTabController(
        length: 2, // length of tabs

        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TabBar(
            indicatorColor: ColorsUtils.primaryYellow,
            labelColor: ColorsUtils.primaryYellow,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: S.current.product_details),
              Tab(text: S.current.product_reviewt),
            ],
          ),
          Container(
            height: 350.h,
            child: TabBarView(children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      viewProductProvider.fetchDate.productDetails.length,
                      (index) => CustomListTile(
                            title: [
                              CustomText(
                                text: locProvider.appLocal == Locale('en')
                                    ? viewProductProvider
                                        .fetchDate.productDetails[index].nameEn
                                    : viewProductProvider
                                        .fetchDate.productDetails[index].nameAr,
                              )
                            ],
                            trailing: [
                              CustomText(
                                text: viewProductProvider
                                    .fetchDate.productDetails[index].value,
                              )
                            ],
                          ))),
              Column(
                  children: List.generate(
                      viewProductProvider.fetchDate.reviews.length,
                      (index) => CustomListTile(
                            title: [
                              CustomText(
                                text: viewProductProvider
                                    .fetchDate.reviews[index].review,
                              )
                            ],
                            trailing: [
                              CustomText(
                                text: viewProductProvider
                                    .fetchDate.reviews[index].userName,
                              )
                            ],
                            subtitle: [
                              RatingBar.builder(
                                initialRating: viewProductProvider
                                    .fetchDate.reviews[index].rate
                                    .toDouble(),
                                // minRating: 1,
                                itemSize: 20.sp,
                                ignoreGestures: false,
                                direction: Axis.horizontal,
                                itemCount: viewProductProvider
                                    .fetchDate.reviews[index].rate,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              // CustomText(
                              //   text: viewProductProvider
                              //       .fetchDate.reviews[index].createdAt,
                              // )
                            ],
                          ))),
            ]),
          )
        ]));
  }
}
