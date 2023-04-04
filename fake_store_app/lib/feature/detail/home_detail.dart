import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../product/const/border/border_radi.dart';
import '../../product/theme/colors.dart';

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
        appBar: AppBar(),
        body: Container(
          height: context.dynamicHeight(0.5),
          margin: context.lowAllPadding,
          decoration: const BoxDecoration(
              color: AppColors.button, borderRadius: BorderRadi.mediumCircular),
          child: Column(
            children: [
              Image.network(
                widget.detailList.images,
                height: context.dynamicHeight(0.3),
              ),
              Text(
                widget.detailList.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                widget.detailList.description,
                maxLines: 2,
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
        ));
  }
}
