import 'package:auto_route/auto_route.dart';
import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../product/const/border/border_radi.dart';
import '../../product/theme/colors.dart';

@RoutePage()
class HomeDetailView extends StatefulWidget {
  final detailList;
  const HomeDetailView({Key? key, required this.detailList}) : super(key: key);
  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: context.midAllPadding,
      child: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadi.medHighCircular,
                    child: Image.network(
                      widget.detailList.images,
                      height: context.dynamicHeight(0.4),
                      width: context.dynamicWidth(0.8),
                    )),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left_sharp,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: context.dynamicHeight(0.5),
            padding: context.lowAllPadding,
            decoration: const BoxDecoration(
                color: AppColors.button,
                borderRadius: BorderRadi.mediumCircular),
            child: Column(
              children: [
                Text(
                  widget.detailList.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  widget.detailList.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.detailList.price.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      widget.detailList.rating.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
