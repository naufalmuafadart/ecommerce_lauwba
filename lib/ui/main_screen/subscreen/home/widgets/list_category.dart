import 'package:ecommerce/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListCategory extends StatefulWidget {
  const ListCategory({super.key});

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  CategoryProvider? categoryProvider;

  @override
  void initState() {
    // panggil product provider
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider!.fetchData();

    // lakukan req api list product
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Consumer<CategoryProvider>(
        builder: (context, value, _) {
          if (value.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.failed) {
            return Center(
              child: Text('Kesalahan terjadi...',
                  style: Theme.of(context).textTheme.bodyMedium),
            );
          }

          if (value.success) {
            return ListView.builder(
              itemCount: value.categories!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed(SUBCATEGORY_SCREEN);
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 5),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                          value.categories![index].categoryImage!,
                        ),
                        title: Text(value.categories![index].categoryName!),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
