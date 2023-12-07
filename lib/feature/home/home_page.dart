import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';
import 'package:yodacentral_sona/misc/utils/router_constant.dart';
import 'package:yodacentral_sona/widget/primary_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        scrolledUnderElevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: Palette.gray200,
            width: 1,
          ),
        ),
        actions: [
          Image.asset('assets/images/menu.png'),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'Welcome back, Sona',
              style: Theme.of(context).typography.black.displayLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Your leads summary and activity.',
              style: Theme.of(context).typography.black.displaySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff667085),
                  ),
            ),
            const SizedBox(
              height: 24,
            ),
            DefaultTabController(
              initialIndex: 0,
              length: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Palette.primary700,
                    labelStyle: Theme.of(context).typography.black.displaySmall!.copyWith(
                          color: Palette.primary700,
                        ),
                    tabs: const [
                      Tab(
                        text: 'Financing',
                        height: 60,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  IndexedStack(
                    index: 0,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OPEN',
                            style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                  color: Palette.gray700,
                                ),
                          ),
                          Text(
                            'Leads in process',
                            style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                  color: Palette.gray500,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(
                            'New financing lead',
                            icon: const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context.pushNamed(registrationNumberRouteName);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: Palette.gray200,
                            height: 1,
                            thickness: 1,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                      horizontal: BorderSide(color: Palette.gray200),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icon_green.png',
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Listing',
                                              style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                                    color: Palette.gray700,
                                                  ),
                                            ),
                                            Text(
                                              'Customer service',
                                              style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                                    color: Palette.gray500,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '2,047',
                                        style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                              color: Palette.gray500,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'CLOSED',
                            style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                  color: Palette.gray700,
                                ),
                          ),
                          Text(
                            'Leads complete',
                            style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                  color: Palette.gray500,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                      horizontal: BorderSide(color: Palette.gray200),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icon_blue.png',
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Purchasing order',
                                              style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                                    color: Palette.gray700,
                                                  ),
                                            ),
                                            Text(
                                              'Marketing officer',
                                              style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                                    color: Palette.gray500,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '2,047',
                                        style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                              color: Palette.gray500,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 48,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
