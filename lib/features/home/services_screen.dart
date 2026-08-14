import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../shared/widgets/category_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ('Electrician', Icons.electrical_services_outlined),
      ('Plumbing', Icons.plumbing_outlined),
      ('AC Repair', Icons.ac_unit_outlined),
      ('Carpentry', Icons.handyman_outlined),
      ('Painting', Icons.format_paint_outlined),
      ('Cleaning', Icons.cleaning_services_outlined),
      ('Appliance Repair', Icons.home_repair_service_outlined),
      ('Pest Control', Icons.pest_control_outlined),
      ('Gardening', Icons.yard_outlined),
      ('Moving Services', Icons.local_shipping_outlined),
      ('Home Maintenance', Icons.home_repair_service_outlined),
      ('Other Services', Icons.more_horiz),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Services',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find a service',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Choose what you need help with.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'All Services',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                final service = services[index];

                return CategoryCard(
                  title: service.$1,
                  icon: service.$2,
                  onTap: () {
                    context.push(
                    '/workers/${Uri.encodeComponent(service.$1)}',
                   );
                    
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}