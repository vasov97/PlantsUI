import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:plants_ui/model/plant.dart';

class PlantCarousel extends StatelessWidget {
  const PlantCarousel({
    Key? key,
    required double percent,
    required this.plantList,
    required int index,
  })  : _percent = percent,
        _index = index,
        super(key: key);

  final double _percent;
  final List<Plant> plantList;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Stack(
          alignment: Alignment.center,
          children: [
            // Third plant
            if (_index > 1)
              _PlantTransforms(
                plant: plantList[_index - 2],
                scale: lerpDouble(.3, 0, _percent)!,
                opacity: lerpDouble(0.5, 0.0, _percent)!,
              ),

            // Second plant
            if (_index > 0)
              _PlantTransforms(
                plant: plantList[_index - 1],
                displacement: lerpDouble((height * .1), 0, _percent)!,
                scale: lerpDouble(.6, .3, _percent)!,
                opacity: lerpDouble(0.8, 0.5, _percent)!,
              ),

            // First plant
            _PlantTransforms(
              plant: plantList[_index],
              displacement:
                  lerpDouble((height * .25), (height * .1), _percent)!,
              scale: lerpDouble(1.0, .6, _percent)!,
              opacity: lerpDouble(1.0, 0.8, _percent)!,
            ),

            // Hide bottom plant
            if (_index < plantList.length - 1)
              _PlantTransforms(
                plant: plantList[_index + 1],
                displacement: lerpDouble(height, (height * .25), _percent)!,
                scale: lerpDouble(2.0, 1.0, _percent)!,
              ),
          ],
        );
      },
    );
  }
}

class _PlantTransforms extends StatelessWidget {
  const _PlantTransforms(
      {Key? key,
      required this.plant,
      this.displacement = 0.0,
      this.scale = 1.0,
      this.opacity = 1.0})
      : super(key: key);

  final double displacement;
  final double scale;
  final double opacity;
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, displacement),
      child: Transform.scale(
        alignment: Alignment.topCenter,
        scale: scale,
        child: Opacity(
          opacity: opacity,
          child: _PlantImage(
            plant: plant,
          ),
        ),
      ),
    );
  }
}

class _PlantImage extends StatelessWidget {
  const _PlantImage({
    Key? key,
    required this.plant,
  }) : super(key: key);
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 0.85,
        child: Hero(
          tag: plant.name,
          child: Image.asset(
            plant.path,
          ),
        ),
      ),
    );
  }
}
