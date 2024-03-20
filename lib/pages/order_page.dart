import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/const.dart';
import 'package:plants_ui/model/plant.dart';
import 'package:plants_ui/widgets/custom_app_bar.dart';

enum PlantSize { small, medium, big }

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.plant}) : super(key: key);
  final Plant plant;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late PlantSize _selectedPlantSize;
  late PageController _pageController;
  int counter = 0;

  @override
  void initState() {
    _selectedPlantSize = PlantSize.medium;
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  void _changePlantSize(PlantSize plantSize) {
    _pageController.animateToPage(
      plantSize.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      _selectedPlantSize = plantSize;
    });
  }

  double _getSizePricePercent(PlantSize plantSize) {
    switch (plantSize) {
      case PlantSize.small:
        return 0.8;
      case PlantSize.medium:
        return 1.0;
      case PlantSize.big:
        return 1.2;
      default:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            counter: counter,
          ),
          SizedBox(
            width: size.width * .65,
            child: Hero(
              tag: "${widget.plant.name}title",
              child: Text(
                widget.plant.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 33,
                  color: AppColors.iconsGreen,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: widget.plant.name,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Image.asset(widget.plant.path),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset(widget.plant.path),
                        ),
                        Image.asset(widget.plant.path),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-.7, .8),
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 600),
                    tween: Tween(begin: 1.0, end: 0.0),
                    curve: Curves.fastOutSlowIn,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-(size.width * .5) * value,
                            (size.height * .4) * value),
                        child: child,
                      );
                    },
                    child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween(
                          begin: 0.0,
                          end: _getSizePricePercent(_selectedPlantSize),
                        ),
                        curve: Curves.fastOutSlowIn,
                        builder: (context, value, _) {
                          return Transform.scale(
                            scale: value,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                "\$${(widget.plant.price * value).toStringAsFixed(1)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                  color: AppColors.iconsGreen,
                                  shadows: [
                                    const Shadow(
                                      color: AppColors.lightGreen,
                                      blurRadius: 25,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: const Alignment(.7, -.7),
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween(begin: 1.0, end: 0.0),
                        curve: Curves.fastOutSlowIn,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset((size.width * .3) * value, 0),
                            child: Transform.rotate(
                              angle: 4.28 * value,
                              child: child,
                            ),
                          );
                        },
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          mini: true,
                          elevation: 10,
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.iconsGreen,
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(.7, -.7),
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween(begin: 1.0, end: 0.0),
                        curve: Curves.fastOutSlowIn,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset((size.width * .3) * value, 0),
                            child: Transform.rotate(
                              angle: 4.28 * value,
                              child: child,
                            ),
                          );
                        },
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              counter--;
                            });
                          },
                          mini: true,
                          elevation: 10,
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.iconsGreen,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Icon(Icons.minimize),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 600),
              tween: Tween(begin: 1.0, end: 0.0),
              curve: Curves.fastOutSlowIn,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, (size.height * .3) * value),
                  child: child,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  PlantSize.values.length,
                  (index) {
                    final plantSize = PlantSize.values[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: _PlantSizeOption(
                          isSelected: (plantSize == _selectedPlantSize),
                          plantSize: plantSize,
                          onTap: () => _changePlantSize(plantSize)),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.iconsGreen,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: size.height * 0.4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                      color: AppColors.iconsGreen,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  loremIpsum,
                                  style: TextStyle(
                                    color: AppColors.iconsGreen,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        width: size.width * 0.55,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: AppColors.iconsGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60)),
                                              child: const Icon(
                                                Icons.height,
                                                color: Colors.white,
                                                size: 36,
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Height',
                                                    style: TextStyle(
                                                      color: AppColors.appGrey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '8.2"',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.iconsGreen,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                        width: size.width * 0.55,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: AppColors.iconsGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60)),
                                              child: const Icon(
                                                Icons.water_drop_outlined,
                                                color: Colors.white,
                                                size: 36,
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Humidity',
                                                    style: TextStyle(
                                                      color: AppColors.appGrey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '62%',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.iconsGreen,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                        width: size.width * 0.55,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color: AppColors.iconsGreen,
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                              ),
                                              child: const Icon(
                                                Icons.thermostat,
                                                color: Colors.white,
                                                size: 36,
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Temperature',
                                                    style: TextStyle(
                                                      color: AppColors.appGrey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '80K',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.iconsGreen,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Text(
                'Info',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PlantSizeOption extends StatelessWidget {
  const _PlantSizeOption({
    Key? key,
    required this.isSelected,
    required this.plantSize,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final PlantSize plantSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final labelSize = plantSize.toString().split('.')[1][0].toLowerCase();
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isSelected
              ? [AppColors.iconsGreen, AppColors.lightGreen]
              : [Colors.grey[300]!, Colors.grey[300]!],
        ).createShader(bounds),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelSize.toUpperCase(),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
