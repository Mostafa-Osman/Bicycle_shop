import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/search/cubit/cubit.dart';
import 'package:udemy_flutter/screens/search/cubit/states.dart';
import 'package:udemy_flutter/shared/components/component.dart';

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
                          child: Text('error 404'),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => ListOfSearchProduct(
                              model: model!.data!.data[index]),
                          separatorBuilder: (context, index) => myDivider(),
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
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14, height: 1.3, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'EGP ${model.price.toString()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        Text(
                          'EGP ${model.oldPrice.toString()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              height: 1.3,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          FavouriteCubit.get(context)
                              .changeFavorites(model.id!, context);
                        },
                        icon: HomeCubit.get(context).favourites[model.id]
                            ? Icon(
                                Icons.favorite,
                                size: 25.0,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: 25.0,
                              ),
                      ),
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
