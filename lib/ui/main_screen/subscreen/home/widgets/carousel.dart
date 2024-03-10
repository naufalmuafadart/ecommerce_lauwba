import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/provider/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselProvider? carouselProvider;

  @override
  void initState() {
    // panggil product provider
    carouselProvider = Provider.of<CarouselProvider>(context, listen: false);
    carouselProvider!.fetchData();

    carouselProvider?.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselProvider>(builder: (context, value, _) {
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
        return CarouselSlider(
          items: List.generate(
            value.carousel!.length,
            (index) => Image.network(
              value.carousel![index].carouselImage!,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              headers: const {
                'Connection': 'keep-alive',
                "Keep-Alive": "timeout=2000, max=5"
              },
            ),
          ),
          options: CarouselOptions(
              height: 160.0, autoPlay: true, viewportFraction: 1),
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
