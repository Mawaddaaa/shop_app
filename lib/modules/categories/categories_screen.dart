import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder: (context, state){
        return ListView.separated(
            itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data![index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length
        );
      } ,
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 250,
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                '${model.image}'
            ),
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            '${model.name}',
            style: const TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)

        ],
      ),
    ),
  );
}
