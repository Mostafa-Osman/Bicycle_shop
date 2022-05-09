import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/home/widgets/banner.dart';
import 'package:udemy_flutter/presentation/home/widgets/product_item.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CustomLoading());
        } else {
          if (state is HomeError) {
            return const Center(
              child: Text(
                'Error',
                style: TextStyle(fontSize: 30, color: red),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  BannerWidget(),
                  StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(1),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    itemCount: homeCubit.homeModel.data.detailsData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ProductItem(
                      index: index,
                    ),
                  ),
                  // const SizedBox(height: 70),
                ],
              ),
            );
          }
        }
      },
    );
  }
}
