import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/model/plant.dart';
import 'package:plants_ui/pages/order_page.dart';
import 'package:plants_ui/widgets/custom_app_bar.dart';
import 'package:plants_ui/widgets/plants_carousel.dart';

enum SliderAction {
  next,
  previous,
  none,
}

class PlantListPage extends StatefulWidget {
  const PlantListPage({
    Key? key,
    this.initialAction,
  }) : super(key: key);

  final SliderAction? initialAction;

  @override
  State<PlantListPage> createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  late PageController _sliderPageController;
  late PageController _titlePageController;
  late int _index;
  late double _percent;

  @override
  void initState() {
    _index = 2;
    _sliderPageController = PageController(initialPage: _index);
    _titlePageController = PageController(initialPage: _index);
    _percent = 0.0;
    _sliderPageController.addListener(_pageListener);

    Future.delayed(const Duration(milliseconds: 400), () {
      _initialAction(widget.initialAction!);
    });

    super.initState();
  }

  @override
  void dispose() {
    _sliderPageController.removeListener(_pageListener);
    _sliderPageController.dispose();
    _titlePageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _index = _sliderPageController.page!.floor();
    _percent = (_sliderPageController.page! - _index).abs();
    setState(() {});
  }

  void _openOrderPage(BuildContext context, Plant plant) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: OrderPage(
              plant: plant,
            ),
          );
        },
      ),
    );
  }

  void _initialAction(SliderAction sliderAction) {
    switch (sliderAction) {
      case SliderAction.none:
        break;
      case SliderAction.next:
        _sliderPageController.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn);
        break;
      case SliderAction.previous:
        _sliderPageController.previousPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const plantList = Plant.plantList;
    return Material(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              counter: 0,
              onTapBack: () => Navigator.pushNamed(context, '/my-main-page'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: PageView.builder(
                itemCount: plantList.length,
                physics: const NeverScrollableScrollPhysics(),
                controller: _titlePageController,
                itemBuilder: (context, index) {
                  return _TitlePlant(plant: plantList[index]);
                },
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 3.5],
                        colors: [
                          Colors.white,
                          AppColors.iconsGreen,
                        ],
                      )),
                    ),
                  ),
                  PlantCarousel(
                    percent: _percent,
                    plantList: plantList,
                    index: _index,
                  ),
                  PageView.builder(
                    controller: _sliderPageController,
                    onPageChanged: (value) {
                      _titlePageController.animateToPage(value,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn);
                    },
                    itemCount: plantList.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => _openOrderPage(context, plantList[_index]),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TitlePlant extends StatelessWidget {
  const _TitlePlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .65,
          child: Hero(
            tag: "${plant.name}title",
            child: Text(
              plant.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          "\$${plant.price}",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.iconsGreen,
                fontSize: 24,
              ),
        ),
      ],
    );
  }
}
