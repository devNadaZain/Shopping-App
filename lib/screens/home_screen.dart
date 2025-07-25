import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  final void Function(ThemeMode) onThemeModeChange;
  const HomeScreen({
    Key? key,
    required this.onLocaleChange,
    required this.onThemeModeChange,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<String> selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = ValueNotifier('all'); // always a valid key
  }

  @override
  void dispose() {
    selectedCategory.dispose();
    super.dispose();
  }

  Widget buildProductImage(Map<String, dynamic> product, {double? height}) {
    if (product['isAsset'] == true) {
      return Image.asset(
        product['asset'],
        fit: BoxFit.cover,
        width: double.infinity,
        height: height,
      );
    } else {
      return Image.network(
        product['image'],
        fit: BoxFit.cover,
        width: double.infinity,
        height: height,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    // Use keys for categories
    final categoryKeys = [
      'all',
      'pasta',
      'pizza',
      'dessert',
      'drinks',
      'salad',
    ];
    final categoryNames = [
      l.categoryAll,
      l.categoryPasta,
      l.categoryPizza,
      l.categoryDessert,
      l.categoryDrinks,
      l.categorySalad,
    ];
    final products = [
      {
        'title': l.productSpaghettiCarbonara,
        'image':
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&w=400',
        'price': ' 19.99',
        'category': 'pasta',
        'isAsset': false,
      },
      {
        'title': l.productPenneArrabbiata,
        'image':
            'https://tastesbetterfromscratch.com/wp-content/uploads/2020/03/Penne-Arrabbiata-1-2.jpg',
        'price': ' 17.99',
        'category': 'pasta',
        'isAsset': false,
      },
      {
        'title': l.productMargheritaPizza,
        'image':
            'https://www.foodandwine.com/thmb/3kzG4PWOAgZIIfZwMBLKqoTkaGQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/margherita-pizza-with-argula-and-prosciutto-FT-RECIPE0721-04368ec288a84d2e997573aca0001d98.jpg',
        'price': ' 29.99',
        'category': 'pizza',
        'isAsset': false,
      },
      {
        'title': l.productPepperoniPizza,
        'image':
            'https://fantinomondello.ca/wp-content/uploads/2021/02/pepperoni_cheese_pizza.jpg',
        'price': ' 34.99',
        'category': 'pizza',
        'isAsset': false,
      },
      {
        'title': l.productChocolateCake,
        'image':
            'https://assets.epicurious.com/photos/56f302b316f9f5a007cc1796/master/pass/chocllate-cake.jpg',
        'price': ' 12.99',
        'category': 'dessert',
        'isAsset': false,
      },
      {
        'title': l.productStrawberryCheesecake,
        'image':
            'https://www.splenda.com/wp-content/themes/bistrotheme/assets/recipe-images/strawberry-topped-cheesecake.jpg',
        'price': ' 14.99',
        'category': 'dessert',
        'isAsset': false,
      },
      {
        'title': l.productFreshOrangeJuice,
        'image':
            'https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?auto=compress&w=400',
        'price': ' 5.99',
        'category': 'drinks',
        'isAsset': false,
      },
      {
        'title': l.productIcedCoffee,
        'image':
            'https://www.coffeetech.com/media/img/products/secondary/Ice-moca-coffee-distribuidor-hosteleria-cafe-chocolate.webp',
        'price': ' 6.99',
        'category': 'drinks',
        'isAsset': false,
      },
      {
        'title': l.productCaesarSalad,
        'image':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&w=400',
        'price': ' 10.99',
        'category': 'salad',
        'isAsset': false,
      },
      {
        'title': l.productGreekSalad,
        'asset': 'assets/images/the-perfect-greek-salad-7 (1).jpg',
        'price': ' 11.99',
        'category': 'salad',
        'isAsset': true,
      },
    ];

    List<Map<String, dynamic>> filteredProducts(String categoryKey) {
      if (categoryKey == 'all') return products.cast<Map<String, dynamic>>();
      return products
          .where((p) => p['category'] == categoryKey)
          .cast<Map<String, dynamic>>()
          .toList();
    }

    final offers = List.generate(
      5,
      (i) => {
        'desc': '${l.hotOffers} ${i + 1}',
        'image':
            'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&w=100&h=100&fit=crop',
        'discount': '${20 + i * 5}% OFF',
      },
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Stack(
            children: [
              // Decorative circles: use dark colors in dark mode
              if (Theme.of(context).brightness == Brightness.light) ...[
                Positioned(
                  top: -size.height * 0.08,
                  left: -size.width * 0.15,
                  child: Container(
                    width: size.width * 0.45,
                    height: size.width * 0.45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF6366F1).withOpacity(0.12),
                          const Color(0xFF8B5CF6).withOpacity(0.10),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -size.height * 0.12,
                  right: -size.width * 0.18,
                  child: Container(
                    width: size.width * 0.55,
                    height: size.width * 0.55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF6366F1).withOpacity(0.10),
                          const Color(0xFF8B5CF6).withOpacity(0.08),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              // Main content
              Column(
                children: [
                  // Modern AppBar
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      size.width * 0.04,
                      size.height * 0.02,
                      size.width * 0.04,
                      0,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(size.width * 0.02),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF6366F1),
                                  const Color(0xFF8B5CF6),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.restaurant_menu,
                              color: Colors.white,
                              size: size.width * 0.06,
                            ),
                          ),
                          SizedBox(width: size.width * 0.03),
                          // Make title flexible and ellipsis
                          Expanded(
                            child: Text(
                              l.headerFoodMenu,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    fontSize: size.width * 0.055,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: size.width * 0.01),
                          Icon(
                            Icons.search,
                            color: const Color(0xFF6366F1),
                            size: size.width * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Category selector
                  SizedBox(
                    height: size.height * 0.06,
                    child: ValueListenableBuilder<String>(
                      valueListenable: selectedCategory,
                      builder: (context, value, _) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.015,
                          ),
                          itemCount: categoryKeys.length,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: size.width * 0.03),
                          itemBuilder: (context, i) {
                            final isSelected = value == categoryKeys[i];
                            return GestureDetector(
                              onTap: () =>
                                  selectedCategory.value = categoryKeys[i],
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.15),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Text(
                                  categoryNames[i],
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : Theme.of(
                                                context,
                                              ).colorScheme.onSurface,
                                        fontSize: size.width * 0.04,
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // Content
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: selectedCategory,
                      builder: (context, value, _) {
                        final filtered = filteredProducts(value);
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Show selected category name
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final idx = categoryKeys.indexOf(value);
                                    final headerText = value == 'all'
                                        ? l.headerAllFoodItems
                                        : (idx != -1
                                              ? categoryNames[idx]
                                              : l.headerAllFoodItems);
                                    return Text(
                                      headerText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                    );
                                  },
                                ),
                              ),
                              // Featured Products PageView
                              if (filtered.isNotEmpty) ...[
                                Container(
                                  height: 220,
                                  child: PageView.builder(
                                    itemCount: filtered.length,
                                    controller: PageController(
                                      viewportFraction: 0.85,
                                    ),
                                    itemBuilder: (context, i) => Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.08,
                                            ),
                                            blurRadius: 18,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Stack(
                                          children: [
                                            buildProductImage(
                                              filtered[i],
                                              height: double.infinity,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.black.withOpacity(
                                                        0.7,
                                                      ),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(24),
                                                        bottomRight:
                                                            Radius.circular(24),
                                                      ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8,
                                                      ), // reduced padding
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            filtered[i]['title']!,
                                                            style: TextStyle(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .onSurface,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          Text(
                                                            filtered[i]['price']!,
                                                            style: TextStyle(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                AppLocalizations.of(
                                                                  context,
                                                                )!.itemAdded,
                                                              ),
                                                              backgroundColor:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primary,
                                                              behavior:
                                                                  SnackBarBehavior
                                                                      .floating,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          foregroundColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onPrimary,
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 12,
                                                                vertical: 8,
                                                              ),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  12,
                                                                ),
                                                          ),
                                                          elevation: 0,
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .add_shopping_cart,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                              // Products Grid
                              Text(
                                l.headerFoodItems,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: filtered.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 12,
                                      childAspectRatio:
                                          1.3, // even more compact cards
                                    ),
                                itemBuilder: (context, i) => Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 12,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          margin: const EdgeInsets.all(
                                            8,
                                          ), // reduced margin
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.10,
                                                ),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            child: buildProductImage(
                                              filtered[i],
                                              height: 60, // smaller image
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ), // reduced padding
                                        child: Column(
                                          mainAxisSize:
                                              MainAxisSize.min, // Hug content
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filtered[i]['title']!,
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12, // smaller font
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              filtered[i]['price']!,
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12, // smaller font
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        AppLocalizations.of(
                                                          context,
                                                        )!.itemAdded,
                                                      ),
                                                      backgroundColor: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.add_shopping_cart,
                                                  size: 12, // smaller icon
                                                ),
                                                label: Text(
                                                  l.buttonAdd,
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  foregroundColor: Theme.of(
                                                    context,
                                                  ).colorScheme.onPrimary,
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                      ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              // Hot Offers Section
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.local_fire_department,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    AppLocalizations.of(context)!.hotOffers,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: offers.length,
                                itemBuilder: (context, i) => Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.10,
                                              ),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.network(
                                            offers[i]['image']!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              offers[i]['desc']!,
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.red.withOpacity(
                                                  0.12,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                offers[i]['discount']!,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF6366F1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: size.height * 0.03,
                right: Directionality.of(context) == TextDirection.ltr
                    ? size.width * 0.04
                    : null,
                left: Directionality.of(context) == TextDirection.rtl
                    ? size.width * 0.04
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      heroTag: 'lang_home',
                      mini: true,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        final isEnglish =
                            Localizations.localeOf(context).languageCode ==
                            'en';
                        widget.onLocaleChange(Locale(isEnglish ? 'ar' : 'en'));
                      },
                      tooltip: 'Switch Language',
                      child: const Icon(Icons.language),
                    ),
                    SizedBox(width: size.width * 0.02),
                    FloatingActionButton(
                      heroTag: 'theme_home',
                      mini: true,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        widget.onThemeModeChange(
                          Theme.of(context).brightness == Brightness.dark
                              ? ThemeMode.light
                              : ThemeMode.dark,
                        );
                      },
                      tooltip: 'Switch Theme',
                      child: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
