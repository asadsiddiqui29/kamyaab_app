import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../shared/widgets/worker_card.dart';

class WorkerListingScreen extends StatelessWidget {
  final String serviceName;

  const WorkerListingScreen({
    super.key,
    this.serviceName = 'Electricians',
  });

  @override
  Widget build(BuildContext context) {
    final workers = [
      {
        'name': 'Ali Khan',
        'profession': 'Electrician',
        'rating': '4.9',
        'reviews': '128',
        'location': '2.1 km away',
        'verified': true,
      },
      {
        'name': 'Ahmed Raza',
        'profession': 'Electrician',
        'rating': '4.8',
        'reviews': '96',
        'location': '3.4 km away',
        'verified': true,
      },
      {
        'name': 'Usman Ali',
        'profession': 'Electrician',
        'rating': '4.7',
        'reviews': '84',
        'location': '4.2 km away',
        'verified': true,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          serviceName,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${workers.length} professionals found',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),

                OutlinedButton.icon(
                  onPressed: () {
                    // Filter/sort will be added later.
                  },
                  icon: const Icon(Icons.tune, size: 18),
                  label: const Text('Filter'),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              itemCount: workers.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final worker = workers[index];

                return _WorkerListItem(
                  name: worker['name'] as String,
                  profession: worker['profession'] as String,
                  rating: worker['rating'] as String,
                  reviews: worker['reviews'] as String,
                  location: worker['location'] as String,
                  verified: worker['verified'] as bool,
                  onTap: () {
                    final workerName = worker['name'] as String;

                    context.push(
                      '/worker/${Uri.encodeComponent(workerName)}',
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkerListItem extends StatelessWidget {
  final String name;
  final String profession;
  final String rating;
  final String reviews;
  final String location;
  final bool verified;
  final VoidCallback onTap;

  const _WorkerListItem({
    required this.name,
    required this.profession,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.verified,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            // Worker avatar
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),

                      if (verified) ...[
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.verified,
                          size: 17,
                          color: AppColors.primary,
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    profession,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 17,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '$rating ($reviews)',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}