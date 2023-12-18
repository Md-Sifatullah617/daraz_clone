import 'package:daraz_clone/utils/colors.dart';
import 'package:daraz_clone/utils/custom_widget/foodPandaBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodPandaPage extends StatefulWidget {
  const FoodPandaPage({super.key});

  @override
  State<FoodPandaPage> createState() => _FoodPandaPageState();
}

class _FoodPandaPageState extends State<FoodPandaPage>
    with SingleTickerProviderStateMixin {
  List categoryList = [
    "Popular",
    "Roti & Paratha",
    "curry",
    "Special Karahi",
    "Rice",
    "Family Package",
    "Dessert",
    "Beverage",
    "Juice",
    "Shakes"
  ];

  List foodList = [
    {
      "name": "Mutton Biriyani",
      "discription":
          "1 pc - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      "price": "Tk 230",
      "image": "assets/images/food.jpeg"
    },
    {
      "name": "Mutton Biriyani",
      "discription":
          "1 pc - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      "price": "Tk 230",
      "image": "assets/images/food.jpeg"
    },
    {
      "name": "Mutton Biriyani",
      "discription":
          "1 pc - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      "price": "Tk 230",
      "image": "assets/images/food.jpeg"
    },
    {
      "name": "Mutton Biriyani",
      "discription":
          "1 pc - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      "price": "Tk 230",
      "image": ""
    },
    {
      "name": "Mutton Biriyani",
      "discription":
          "1 pc - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      "price": "Tk 230",
      "image": ""
    },
    {
      "name": "Mutton Biriyani",
      "discription":
          "1 pc - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      "price": "Tk 230",
      "image": "assets/images/food.jpeg"
    },
  ];
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  List<double> tabOffsets = [];
  double scrollPossition = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: currentIndex, length: categoryList.length, vsync: this);
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    print('Scroll position: ${_scrollController.offset}');
    setState(() {
      scrollPossition = _scrollController.offset;
    });
    // This method calculates the offset of each section and stores it in the tabOffsets list
    for (int i = 0; i < categoryList.length; i++) {
      double offset = 0;
      for (int j = 0; j < i; j++) {
        offset += 50 + 10;
      }
      tabOffsets.add(offset);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            //favorite share search option
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.foodpandaColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: AppColors.foodpandaColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColors.foodpandaColor,
              ),
            ),
          ],
          bottom: scrollPossition > 485
              ? PreferredSize(
                  preferredSize: Size.fromHeight(30.h),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: AppColors.foodpandaColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.foodpandaColor,
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    onTap: (index) {
                      _scrollController.animateTo(
                        tabOffsets[index],
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    tabs: categoryList
                        .map((e) => Tab(
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                )
              : null,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const UpperPartoftheScreen(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              //food categories in tab bar
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: AppColors.foodpandaColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.foodpandaColor,
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  _scrollController.animateTo(
                    tabOffsets[index],
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                tabs: categoryList
                    .map((e) => Tab(
                          child: Text(e),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: Get.height * 9.5,
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                                text: "🔥Popular\n",
                                style: Theme.of(context).textTheme.titleLarge,
                                children: [
                              TextSpan(
                                text: "Most ordered right now",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ])),
                      ),
                      //food items
                      PopularSection(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Roti & Paratha",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Curry",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Special Karahi",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Rice",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Family Package",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Dessert",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Beverage",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Juice",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                          vertical: Get.height * 0.02,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "Shakes",
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                      customFoodListView(),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.foodpandaColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //number of items
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: AppColors.foodpandaColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Text(
                    'View your cart',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  //total price
                  Text(
                    'Tk 460',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  ListView customFoodListView() {
    return ListView.separated(
      itemCount: foodList.length,
      separatorBuilder: (context, index) => Divider(),
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          foodPandaBottomSheet(context, data: foodList[index]);
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodList[index]["name"],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  foodList[index]["discription"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black54),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(foodList[index]["price"]),
              ],
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          Stack(
            children: [
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                margin: EdgeInsets.symmetric(
                    horizontal: Get.height * 0.01, vertical: Get.height * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: foodList[index]["image"] == ""
                        ? null
                        : DecorationImage(
                            image:
                                AssetImage(foodList[index]["image"].toString()),
                            fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 0,
                right: -5,
                child: Container(
                  height: Get.height * 0.03,
                  width: Get.width * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.foodpandaColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Get.width * 0.02,
              mainAxisSpacing: Get.width * 0.02),
          itemBuilder: (context, index) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/food.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    stops: const [0.2, 0.5],
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.01,
                left: Get.width * 0.01,
                child: Text(
                  "Mutton Biriyani",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: Get.height * 0.01,
                right: Get.width * 0.01,
                child: Container(
                  height: Get.height * 0.03,
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "from Tk Tk 230",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Container(
          height: Get.height * 0.25,
          width: Get.width,
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Fellow foodies say",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: AppColors.foodpandaColor),
                    ))
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            //review
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                    width: Get.width * 0.7,
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.02,
                        vertical: Get.height * 0.01),
                    margin: EdgeInsets.only(right: Get.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industr."),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.foodpandaColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.foodpandaColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.foodpandaColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.foodpandaColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.foodpandaColor,
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            Text(
                              "Saima",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            Text(
                              "6 months ago",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class UpperPartoftheScreen extends StatelessWidget {
  const UpperPartoftheScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          decoration: BoxDecoration(
            color: AppColors.foodpandaColor.withOpacity(0.1),
          ),
          child: Row(children: [
            Expanded(
              child: Text(
                  "Khabar: ৳50 off over ৳200 order (2 times) | Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(
                      color: AppColors.foodpandaColor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Image.asset(
              "assets/images/voucher_panda.png",
            )
          ]),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/shop.png",
                    height: Get.height * 0.05,
                    width: Get.height * 0.05,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Expanded(
                    child: Text(
                      "Rabbani Hotel & Restaurent (মোহাম্মদপুর)",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "1Km away | 30-40 min | 4.5 (1.5K+) | \nService Fees Applies",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "More Info",
                        style: TextStyle(color: AppColors.foodpandaColor),
                      ))
                ],
              ),
              //rating
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: AppColors.foodpandaColor,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Text(
                    "4.5",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Text(
                    "1.5K+ ratings",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See Reviews",
                        style: TextStyle(color: AppColors.foodpandaColor),
                      ))
                ],
              ),
              //delivery time
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColors.foodpandaColor,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Text("Delivery Time: 30-40 min",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Change",
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              ),
              Container(
                height: Get.height * 0.15,
                width: Get.width,
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
                decoration: BoxDecoration(
                    color: AppColors.foodpandaColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Voucher: PandaDeal",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Use code PANDADEAL to get ৳50 off over ৳200 order (2 times)",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
