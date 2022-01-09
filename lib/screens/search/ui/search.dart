import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/search/cubit/cubit.dart';
import 'package:udemy_flutter/screens/search/cubit/states.dart';
import 'package:udemy_flutter/shared/components/Custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SearchCubit.get(context).searchModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: searchController,
                onFieldSubmitted: (text) {
                  SearchCubit.get(context).search(text);
                },
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
          body: (state is SearchInitialState)
              ? SizedBox()
              : (state is SearchLoadingState)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (state is SearchErrorState)
                      ? Center(
                          child: CustomText(text:'error 404'),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => ListOfSearchProduct(
                              model: model!.data!.data[index]),
                          separatorBuilder: (context, index) => CustomDivider(),
                          itemCount: model!.data!.data.length),
        );
      },
    );
  }
}

class ListOfSearchProduct extends StatelessWidget {
  final model;

  const ListOfSearchProduct({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120,
                  height: 120,
                ),
                if (model.discount != 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/icons/discount.png",
                    ),
                    width: 30,
                  ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                  text:  model.name,
                        fontSize: 14, fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomText(
                        text: 'EGP ${model.price.toString()}',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textColor: mainColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        CustomText(
                            text: 'EGP ${model.oldPrice.toString()}',
                            fontSize: 13,
                            textColor: grey,
                            decoration: TextDecoration.lineThrough),
                      Spacer(),
                      CustomFavouriteIcon(
                          onPressed: () => FavouriteCubit.get(context)
                              .changeFavorites(model.id!, context),
                          checkFavourite:
                              HomeCubit.get(context).favourites[model.id])
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
