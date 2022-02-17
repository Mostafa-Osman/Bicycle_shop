import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/home/widgets/banner.dart';
import 'package:udemy_flutter/presentation/home/widgets/build_item.dart';

class HomeBody extends StatelessWidget {
  final model;

  const HomeBody({required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
         BannerWidget(),
          StaggeredGridView.countBuilder(
            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            //direction of scrolling
            scrollDirection: Axis.vertical,
            //to make products in home page scrolling
            physics: ScrollPhysics(),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount:  model.data!.detailsData.length,
            itemBuilder: (BuildContext context, int index) =>
                BuildItem(data: model.data!.detailsData[index]),
          ),
        ],
      ),
    );
  }
}
