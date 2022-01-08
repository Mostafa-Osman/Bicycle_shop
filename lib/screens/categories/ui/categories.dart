import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/categories/category_cubit/category_cubit.dart';
import 'package:udemy_flutter/screens/categories/category_cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryStates>(
        builder: (context, state) {
          return (state is CategoriesSuccessState)
              ? ListView.builder(
                  itemBuilder: (context, index) => CustomCard(
                        widget: Body(
                            model: CategoryCubit.get(context)
                                .categoriesModel!
                                .data!
                                .data[index]),
                      ),
                  itemCount: CategoryCubit.get(context)
                      .categoriesModel!
                      .data!
                      .data
                      .length)
              : Center(child: CircularProgressIndicator(color: red));
        },
        listener: (context, state) {});
  }
}

class Body extends StatelessWidget {
  final model;

  const Body({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage('${model.image}'),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '${model.name}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
