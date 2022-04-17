import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/home/widgets/product_item.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      physics: const ScrollPhysics(),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: homeCubit.homeModel.data.detailsData.length,
      itemBuilder: (BuildContext context, int index) => BuildItem(
        data: homeCubit.homeModel.data.detailsData[index],
      ),
    );
  }
}
