import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:udemy_flutter/screens/home/ui/build_item.dart';

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
          //banner
          CarouselSlider(
            items: HomeCubit.get(context)
                .banner!
                .data
                .map((e) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          image: NetworkImage('${e.image}'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
                height: 200.0,
                initialPage: 4,
                autoPlay: false,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.0,
                scrollDirection: Axis.horizontal),
          ),

          SizedBox(
            height: 20,
          ),
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
