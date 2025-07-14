import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final categories = ['All', 'Pizza', 'Burger', 'Dessert', 'Drinks', 'Salad'];
    // Sample food items with categories and real food images
    final products = [
      {
        'title': 'Margherita Pizza',
        'image':
            'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&w=400', // Margherita pizza
        'price': ' 29.99',
        'category': 'Pizza',
      },
      {
        'title': 'Pepperoni Pizza',
        'image':
            'https://images.pexels.com/photos/4109126/pexels-photo-4109126.jpeg?auto=compress&w=400', // Pepperoni pizza
        'price': ' 34.99',
        'category': 'Pizza',
      },
      {
        'title': 'Classic Burger',
        'image':
            'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&w=400', // Classic burger
        'price': ' 24.99',
        'category': 'Burger',
      },
      {
        'title': 'Cheese Burger',
        'image':
            'https://images.pexels.com/photos/161674/appetite-beef-big-bread-161674.jpeg?auto=compress&w=400', // Cheese burger
        'price': ' 26.99',
        'category': 'Burger',
      },
      {
        'title': 'Chocolate Cake',
        'image':
            'https://images.pexels.com/photos/533325/pexels-photo-533325.jpeg?auto=compress&w=400', // Chocolate cake
        'price': ' 12.99',
        'category': 'Dessert',
      },
      {
        'title': 'Strawberry Dessert',
        'image':
            'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&w=400', // Strawberry dessert
        'price': ' 14.99',
        'category': 'Dessert',
      },
      {
        'title': 'Fresh Orange Juice',
        'image':
            'https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?auto=compress&w=400', // Orange juice
        'price': ' 5.99',
        'category': 'Drinks',
      },
      {
        'title': 'Iced Coffee',
        'image':
            'https://images.pexels.com/photos/302902/pexels-photo-302902.jpeg?auto=compress&w=400', // Iced coffee
        'price': ' 6.99',
        'category': 'Drinks',
      },
      {
        'title': 'Caesar Salad',
        'image':
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&w=400', // Caesar salad
        'price': ' 10.99',
        'category': 'Salad',
      },
      {
        'title': 'Greek Salad',
        'image':
            'https://images.pexels.com/photos/1435893/pexels-photo-1435893.jpeg?auto=compress&w=400', // Greek salad
        'price': ' 11.99',
        'category': 'Salad',
      },
    ];
    // State for selected category
    final ValueNotifier<String> selectedCategory = ValueNotifier('All');
    // Filtered products by selected category
    List<Map<String, String>> filteredProducts(String category) {
      if (category == 'All') return products.cast<Map<String, String>>();
      return products
          .where((p) => p['category'] == category)
          .cast<Map<String, String>>()
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFF8FAFC),
              const Color(0xFFF1F5F9),
              const Color(0xFFE2E8F0),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Soft blurred decorative circles
              Positioned(
                top: -60,
                left: -60,
                child: Container(
                  width: 180,
                  height: 180,
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
                bottom: -80,
                right: -80,
                child: Container(
                  width: 220,
                  height: 220,
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
              // Main content
              Column(
                children: [
                  // Modern AppBar
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF6366F1),
                                  const Color(0xFF8B5CF6),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.restaurant_menu,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Food Menu',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Color(0xFF6366F1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Category selector
                  SizedBox(
                    height: 48,
                    child: ValueListenableBuilder<String>(
                      valueListenable: selectedCategory,
                      builder: (context, value, _) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          itemCount: categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, i) {
                            final isSelected = value == categories[i];
                            return GestureDetector(
                              onTap: () =>
                                  selectedCategory.value = categories[i],
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF6366F1)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: const Color(
                                              0xFF6366F1,
                                            ).withOpacity(0.15),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Text(
                                  categories[i],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF6366F1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
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
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                        color: Colors.white,
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
                                            Image.network(
                                              filtered[i]['image']!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
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
                                                            style:
                                                                const TextStyle(
                                                                  color: Colors
                                                                      .white,
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
                                                            style:
                                                                const TextStyle(
                                                                  color: Color(
                                                                    0xFF6366F1,
                                                                  ),
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
                                                                l.itemAdded,
                                                              ),
                                                              backgroundColor:
                                                                  const Color(
                                                                    0xFF6366F1,
                                                                  ),
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
                                                              const Color(
                                                                0xFF6366F1,
                                                              ),
                                                          foregroundColor:
                                                              Colors.white,
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
                                'Food Items',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F2937),
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
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      childAspectRatio: 0.75,
                                    ),
                                itemBuilder: (context, i) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
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
                                          margin: const EdgeInsets.all(12),
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
                                            child: Image.network(
                                              filtered[i]['image']!,
                                              width: double.infinity,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                filtered[i]['title']!,
                                                style: const TextStyle(
                                                  color: Color(0xFF1F2937),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                filtered[i]['price']!,
                                                style: const TextStyle(
                                                  color: Color(0xFF6366F1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          l.itemAdded,
                                                        ),
                                                        backgroundColor:
                                                            const Color(
                                                              0xFF6366F1,
                                                            ),
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
                                                  icon: const Icon(
                                                    Icons.add_shopping_cart,
                                                    size: 16,
                                                  ),
                                                  label: const Text('Add'),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFF6366F1),
                                                    foregroundColor:
                                                        Colors.white,
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          vertical: 8,
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
                                    l.hotOffers,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1F2937),
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
                                    color: Colors.white,
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
                                              style: const TextStyle(
                                                color: Color(0xFF1F2937),
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
                                                style: const TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
