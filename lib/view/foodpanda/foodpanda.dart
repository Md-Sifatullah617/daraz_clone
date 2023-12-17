import 'package:daraz_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPandaPage extends StatefulWidget {
  const FoodPandaPage({super.key});

  @override
  State<FoodPandaPage> createState() => _FoodPandaPageState();
}

class _FoodPandaPageState extends State<FoodPandaPage> {
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const UpperPartoftheScreen(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              //food categories in tab bar
              TabBar(
                isScrollable: true,
                labelColor: AppColors.foodpandaColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.foodpandaColor,
                tabAlignment: TabAlignment.start,
                tabs: categoryList
                    .map((e) => Tab(
                          child: Text(e),
                        ))
                    .toList(),
              ),
              Container(
                height: Get.height * 3,
                child: TabBarView(children: [
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
                      Column(
                        children: [
                          ListView.separated(
                            itemCount: foodList.length,
                            separatorBuilder: (context, index) => Divider(),
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05,
                                vertical: Get.height * 0.02),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          foodList[index]["name"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
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
                                            horizontal: Get.height * 0.01,
                                            vertical: Get.height * 0.01),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: foodList[index]["image"] ==
                                                    ""
                                                ? null
                                                : DecorationImage(
                                                    image: AssetImage(
                                                        foodList[index]["image"]
                                                            .toString()),
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
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
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
