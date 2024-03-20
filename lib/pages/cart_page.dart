import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/widgets/rounded_icon_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double shippingCost = 15;
  double totalPrice = 15;
  double subTotal = 0;
  double price01 = 4.2;
  double price02 = 3.6;
  double price03 = 3.0;
  double price04 = 5.5;
  int quantity01 = 0;
  int quantity02 = 0;
  int quantity03 = 0;
  int quantity04 = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.more_vert_outlined,
                color: AppColors.iconsGreen,
              ),
            )
          ],
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedIconButton(
              icon: Icons.arrow_back_ios,
              iconColor: AppColors.iconsGreen,
              color: AppColors.lightGreen,
              size: 20,
              onPressed: () => Navigator.pushNamed(context, '/my-main-page'),
            ),
          ),
          title: const Text(
            'My Cart',
            style: TextStyle(
              color: AppColors.iconsGreen,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.5,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: screenWidth * 0.9,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: AppColors.appGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/01.png',
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'Sansevieria',
                                            style: TextStyle(
                                                color: AppColors.iconsGreen,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.28,
                                          ),
                                          const Icon(
                                            Icons.more_vert_outlined,
                                            color: AppColors.iconsGreen,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Its spines don\'t grow',
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity01++;
                                                    subTotal += price01;
                                                    totalPrice += subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              quantity01.toString(),
                                              style: const TextStyle(
                                                  color: AppColors.iconsGreen,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity01--;
                                                    subTotal -= price01;
                                                    totalPrice -= subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.3,
                                          ),
                                          const Text(
                                            '\$4.20',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 31, 136, 36),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: screenWidth * 0.9,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset('assets/02.png'),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'Jade plant',
                                            style: TextStyle(
                                                color: AppColors.iconsGreen,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.28,
                                          ),
                                          const Icon(
                                            Icons.more_vert_outlined,
                                            color: AppColors.iconsGreen,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Its spines don\'t grow',
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity02++;
                                                    subTotal += price02;
                                                    totalPrice += subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              quantity02.toString(),
                                              style: const TextStyle(
                                                  color: AppColors.iconsGreen,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity02--;
                                                    subTotal -= price02;
                                                    totalPrice -= subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.3,
                                          ),
                                          const Text(
                                            '\$3.60',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 31, 136, 36),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: screenWidth * 0.9,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset('assets/03.png'),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'Lucky bamboo',
                                            style: TextStyle(
                                                color: AppColors.iconsGreen,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.20,
                                          ),
                                          const Icon(
                                            Icons.more_vert_outlined,
                                            color: AppColors.iconsGreen,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Its spines don\'t grow',
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity03++;
                                                    subTotal += price03;
                                                    totalPrice += subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              quantity03.toString(),
                                              style: const TextStyle(
                                                  color: AppColors.iconsGreen,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity03--;
                                                    subTotal -= price03;
                                                    totalPrice -= subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.3,
                                          ),
                                          const Text(
                                            '\$3.00',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 31, 136, 36),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: screenWidth * 0.9,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.orange[400],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/04.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'Aglaonema',
                                            style: TextStyle(
                                                color: AppColors.iconsGreen,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.28,
                                          ),
                                          const Icon(
                                            Icons.more_vert_outlined,
                                            color: AppColors.iconsGreen,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Its spines don\'t grow',
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity04++;
                                                    subTotal += price04;
                                                    totalPrice += subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              quantity04.toString(),
                                              style: const TextStyle(
                                                  color: AppColors.iconsGreen,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.iconsGreen),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: IconButton(
                                                padding: const EdgeInsets.only(
                                                    right: 1),
                                                onPressed: () {
                                                  setState(() {
                                                    quantity04--;
                                                    subTotal -= price04;
                                                    totalPrice -= subTotal;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: AppColors.iconsGreen,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.3,
                                          ),
                                          const Text(
                                            '\$5.50',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 31, 136, 36),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        'Subtotal:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 31, 136, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      '\$${subTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 31, 136, 36),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        'Shipping Cost:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 31, 136, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      '\$${shippingCost.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 31, 136, 36),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Divider(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        'Total:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 31, 136, 36),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 31, 136, 36),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 20, top: 40),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.iconsGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Place your order',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
