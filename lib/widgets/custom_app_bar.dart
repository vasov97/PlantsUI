import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.brightness = Brightness.light,
    this.onTapBack,
    required this.counter,
  }) : super(key: key);
  final Brightness brightness;
  final VoidCallback? onTapBack;
  final int counter;
  @override
  Widget build(BuildContext context) {
    final isDarkBrightness = (brightness == Brightness.dark);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onTapBack ??
                  () {
                    if (Navigator.canPop(context)) Navigator.pop(context);
                  },
            ),
            Stack(
              children: [
                IconButton(
                  iconSize: 32,
                  color: Colors.black,
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {},
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: isDarkBrightness
                          ? AppColors.iconsGreen
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Text(
                        counter.toString(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: isDarkBrightness
                                  ? Colors.white
                                  : AppColors.iconsGreen,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
