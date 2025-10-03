import 'package:flutter/material.dart';
import 'package:islami/data/api_manager.dart';
import 'package:islami/home/radio/radio_component.dart';

import '../../data/model/radios_model.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/images/radio_image.png')),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        FutureBuilder<List<Radios>?>(
          future: ApiManager.getRadios(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: PageView.builder(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  // disable manual swipe
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return RadioComponent(
                      radio: snapshot.data![index],
                      controller: pageController,
                      index: index,
                      total: snapshot.data!.length,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
