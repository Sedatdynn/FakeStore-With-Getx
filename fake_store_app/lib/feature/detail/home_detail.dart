import 'package:auto_route/auto_route.dart';
import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:fake_store_app/product/widget/text/product_text.dart';
import 'package:flutter/material.dart';

import '../../product/const/border/border_radi.dart';
import '../../product/theme/colors.dart';

@RoutePage()
class HomeDetailView extends StatefulWidget {
  final dynamic detailList;
  const HomeDetailView({Key? key, required this.detailList}) : super(key: key);
  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: context.midAllPadding,
          child: ListView(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: context.dynamicWidth(0.9),
                      decoration: const BoxDecoration(
                          color: AppColors.mainPrimary,
                          borderRadius: BorderRadi.lowCircular),
                      margin: context.extremeLowAllPadding,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            width: context.dynamicWidth(0.85),
                            child: ClipRRect(
                                borderRadius: BorderRadi.medHighCircular,
                                child: Image.network(
                                  widget.detailList.images,
                                  height: context.dynamicHeight(0.4),
                                  width: context.dynamicWidth(0.8),
                                )),
                          ),
                          Padding(
                            padding: context.midAllPadding,
                            child: Column(
                              children: [
                                ProductText(text: widget.detailList.title),
                                ProductText(
                                  text: widget.detailList.description,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      widget.detailList.price.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      widget.detailList.rating.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left_sharp,
                      size: context.dynamicHeight(0.07),
                    ),
                  ),
                ],
              ),
              // Container(
              //   height: context.dynamicHeight(0.5),
              //   padding: context.lowAllPadding,
              //   decoration: const BoxDecoration(
              //       color: AppColors.white,
              //       borderRadius: BorderRadi.mediumCircular),
              //   //            decoration: BoxDecoration(boxShadow: [
              //   //   BoxShadow(
              //   //     color: Colors.grey.withOpacity(0.1),
              //   //     spreadRadius: 5,
              //   //     blurRadius: 7,
              //   //     offset: Offset(0, 5),
              //   //   ),
              //   // ]),
              //   child:
              // ),
            ],
          ),
        ));
  }
}
