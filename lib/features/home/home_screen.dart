import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../shared/data/banner_data.dart';
import '../../shared/data/worker_data.dart';
import '../../shared/widgets/banner_carousel.dart';
import '../../shared/widgets/feature_card.dart';
import '../../shared/widgets/search_bar.dart';
import '../../shared/widgets/worker_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ============================================================
              // GREEN HEADER
              // ============================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  28,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Top row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // Greeting
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Good Morning,',
                              style: TextStyle(
                                color: Color.fromARGB(179, 255, 255, 255),
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 3),

                            const Text(
                              'Asad 👋',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white70,
                                  size: 15,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Gulshan-e-Iqbal, Karachi',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Notification
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: KamyaabSearchBar(
                        onTap: () {
                          // Search screen will be connected later.
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // ============================================================
              // PROMOTIONAL BANNER CAROUSEL
              // ============================================================

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const BannerCarousel(
                  banners: kamyaabBanners,
                ),
              ),

              const SizedBox(height: 25),

              // ============================================================
              // QUICK ACTIONS
              // ============================================================

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 125,
                  child: Row(
                    children: [

                      Expanded(
                        child: FeatureCard(
                          title: 'Urgent Need',
                          icon: Icons.flash_on_outlined,
                          onTap: () {
                            context.push('/urgent');
                          },
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: FeatureCard(
                          title: 'Book Worker',
                          icon: Icons.handyman_outlined,
                          onTap: () {
                            context.push('/services');
                          },
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: FeatureCard(
                          title: 'Recent Jobs',
                          icon: Icons.history,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ============================================================
              // TOP WORKERS
              // ============================================================

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Top Workers',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Highly rated professionals near you',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Worker carousel
              const WorkerCarousel(
                workers: topWorkers,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // ==============================================================
      // BOTTOM NAVIGATION
      // ==============================================================

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,

        onDestinationSelected: (index) {
          // GoRouter navigation will be connected here later.
        },

        backgroundColor: Colors.white,

        elevation: 8,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view),
            label: 'Services',
          ),

          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}