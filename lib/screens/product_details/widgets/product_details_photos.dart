import 'package:flutter/material.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/home/model/home_model.dart';

class ProductDetailsPhotos extends StatelessWidget {
  final DetailsData productDetails;

  ProductDetailsPhotos({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //photo
        Container(
          height: 250.0,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            itemExtent: 400.0,
            itemCount: productDetails.images!.length,
            itemBuilder: (context, index) {
              HomeCubit.get(context).changePhotoIndex(index - 1);
              return Image(
                image: NetworkImage(productDetails.images![index]),
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        // small photo
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
          child: Container(
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: productDetails.images!.length,
              itemBuilder: (context, index) {
                return (index == HomeCubit.get(context).photoIndex)
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.green, width: 2)),
                        child: Image(
                          image: NetworkImage(productDetails.images![index]),
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    : Image(
                        image: NetworkImage(productDetails.images![index]),
                        fit: BoxFit.cover,
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
