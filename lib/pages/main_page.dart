import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/pages/cart_page.dart';
import 'package:plants_ui/pages/profile_page.dart';

import 'package:plants_ui/widgets/category_widget.dart';
import 'package:plants_ui/widgets/rounded_icon_button.dart';
import 'package:plants_ui/widgets/rounded_text_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _searchController = TextEditingController();
  List category = ['Recommend', 'Top', 'Indoor', 'Outdoor', 'Exotic'];
  int clicked = 0;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/boy.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RoundedIconButton(
                        icon: Icons.shopping_cart,
                        onPressed: () {},
                        size: 43,
                        color: AppColors.iconsGreen,
                        padding: 3,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Let\'s find your\nplants!',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 25, 84, 28),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedTextField(
                  controller: _searchController,
                  icon: Icons.search,
                  hintText: 'Search Plant',
                  color: AppColors.lightGreen,
                  iconColor: AppColors.iconsGreen,
                  inputType: TextInputType.name,
                  isSearchField: true,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: myHeight * 0.03,
                    left: myWidth * 0.06,
                    right: myWidth * 0.06,
                  ),
                  child: SizedBox(
                    height: myHeight * 0.06,
                    width: myWidth,
                    child: ListView.builder(
                      itemCount: category.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          index: index,
                          category: category,
                          clicked: clicked,
                          onClick: () {
                            setState(() {
                              clicked = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: ContainerWithWaveClipPath(),
                ),
                const Text(
                  'Recently Viewed',
                  style: TextStyle(
                    color: AppColors.iconsGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: myWidth * 0.55,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.orange[300],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset('assets/05.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Calathea',
                                    style: TextStyle(
                                      color: AppColors.iconsGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Lorem ispsum',
                                    style: TextStyle(
                                      color: AppColors.appGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: myWidth * 0.55,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 196, 229, 231),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset('assets/05.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Calathea',
                                    style: TextStyle(
                                      color: AppColors.iconsGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Lorem ispsum',
                                    style: TextStyle(
                                      color: AppColors.appGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: myWidth * 0.55,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 187, 186, 185),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset('assets/05.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Calathea',
                                    style: TextStyle(
                                      color: AppColors.iconsGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Lorem ispsum',
                                    style: TextStyle(
                                      color: AppColors.appGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: myWidth * 0.55,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.orange[300],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset('assets/05.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Calathea',
                                    style: TextStyle(
                                      color: AppColors.iconsGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Lorem ispsum',
                                    style: TextStyle(
                                      color: AppColors.appGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWithWaveClipPath extends StatelessWidget {
  const ContainerWithWaveClipPath({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: 250,
                height: 415,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 220,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Indoor',
                                      style: TextStyle(
                                        color: AppColors.iconsGreen,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Sansevieria',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 31, 80, 34),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '\$4.2',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 54, 177, 58),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(185, 76, 129, 78),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 220,
                        height: 210,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 110,
                right: 40,
                child: Image.asset('assets/01.png'),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: 250,
                height: 415,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 220,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Indoor',
                                      style: TextStyle(
                                        color: AppColors.iconsGreen,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Jade plant',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 31, 80, 34),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '\$3.6',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 54, 177, 58),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(185, 76, 129, 78),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 220,
                        height: 210,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 40,
                right: 20,
                child: Image.asset(
                  'assets/02.png',
                  width: 250,
                  height: 350,
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: 250,
                height: 415,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 220,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Outdoor',
                                      style: TextStyle(
                                        color: AppColors.iconsGreen,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Lucky bamboo',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 31, 80, 34),
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '\$3.0',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 54, 177, 58),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(185, 76, 129, 78),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 220,
                        height: 210,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 40,
                right: 33,
                child: Image.asset(
                  'assets/03.png',
                  width: 250,
                  height: 350,
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: 250,
                height: 415,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 220,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Indoor',
                                      style: TextStyle(
                                        color: AppColors.iconsGreen,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Aglaonema',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 31, 80, 34),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '\$5.5',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 54, 177, 58),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(185, 76, 129, 78),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 220,
                        height: 210,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 42,
                right: 22,
                child: Image.asset(
                  'assets/04.png',
                  width: 300,
                  height: 350,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double curveHeight = 20.0;
    const double controlPointOffset = 20.0;

    path.lineTo(size.width * 0.002, size.height - curveHeight);

    // path.quadraticBezierTo(
    //   size.width / 4,
    //   size.height - curveHeight - controlPointOffset,
    //   size.width / 2,
    //   size.height - curveHeight,
    // );

    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height - curveHeight + controlPointOffset,
      size.width + controlPointOffset,
      size.height / 2,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
