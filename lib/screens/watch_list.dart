import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:watches_3d_ui/models/watch.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 10),
              const TitleText(text: 'Discover'),
              const SizedBox(height: 24.0),
              WatchBrandSelector(
                brands: Brand.values.toList(),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                height: 320.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: watches.length,
                  itemBuilder: (context, index) => WatchCard(
                    watch: watches[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WatchCard extends StatelessWidget {
  const WatchCard({
    Key? key,
    required this.watch,
  }) : super(key: key);
  final Watch watch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      margin: const EdgeInsets.only(right: 24.0),
      decoration: BoxDecoration(
        color: watch.color,
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            bottom: -32.0,
            right: -16.0,
            child: Image.asset(
              watch.image,
              width: 170.0,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class WatchBrandSelector extends StatefulWidget {
  final List brands;
  const WatchBrandSelector({
    Key? key,
    required this.brands,
  }) : super(key: key);

  @override
  State<WatchBrandSelector> createState() => _WatchBrandSelectorState();
}

class _WatchBrandSelectorState extends State<WatchBrandSelector> {
  Brand? activeBrand;
  @override
  void initState() {
    super.initState();
    activeBrand = Brand.All;
  }

  final TextStyle activeBrandStyle =
      const TextStyle(fontWeight: FontWeight.w500);
  final TextStyle inactiveBrandStyle =
      TextStyle(color: Colors.black.withOpacity(0.3));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.brands
            .map(
              (brand) => Row(
                children: [
                  Text(
                    brand.toString().split('.').last,
                    style: brand == activeBrand
                        ? activeBrandStyle
                        : inactiveBrandStyle,
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30.0,
        letterSpacing: -0.8,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            const CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/apple_series_5.png'),
            ),
          ],
        ),
      ],
    );
  }
}
