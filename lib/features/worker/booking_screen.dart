import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../core/theme/app_colors.dart';

class BookingScreen extends StatefulWidget {
  final String workerName;
  final String serviceName;

  const BookingScreen({
    super.key,
    this.workerName = 'Ali Khan',
    this.serviceName = 'Electrician',
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int currentStep = 0;

  final List<String> steps = [
    'Service',
    'Date & Time',
    'Address',
    'Confirmation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Book a Worker',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Column(
        children: [
          // Timeline
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
            child: SizedBox(
              height: 95,
              child: Row(
                children: List.generate(
                  steps.length,
                  (index) {
                    final active = index <= currentStep;

                    return Expanded(
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.center,

                        isFirst: index == 0,
                        isLast: index == steps.length - 1,

                        beforeLineStyle: LineStyle(
                          color: index <= currentStep
                              ? AppColors.primary
                              : AppColors.border,
                          thickness: 3,
                        ),

                        afterLineStyle: LineStyle(
                          color: index < currentStep
                              ? AppColors.primary
                              : AppColors.border,
                          thickness: 3,
                        ),

                        indicatorStyle: IndicatorStyle(
                          width: 30,
                          height: 30,
                          indicator: Container(
                            decoration: BoxDecoration(
                              color: active
                                  ? AppColors.primary
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: active
                                    ? AppColors.primary
                                    : AppColors.border,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: active
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 17,
                                    )
                                  : Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        endChild: Padding(
                          padding: const EdgeInsets.only(top: 38),
                          child: Text(
                            steps[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: active
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: active
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Current step content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: _buildCurrentStep(),
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                currentStep == steps.length - 1
                    ? 'Confirm Booking'
                    : 'Continue',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return _serviceStep();

      case 1:
        return _dateTimeStep();

      case 2:
        return _addressStep();

      case 3:
        return _confirmationStep();

      default:
        return const SizedBox();
    }
  }

  Widget _serviceStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Booking Details',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Review the service and professional you selected.',
          style: TextStyle(
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 25),

        _InfoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selected Service',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                widget.serviceName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Professional',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.background,
                    child: Icon(
                      Icons.person,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    widget.workerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(width: 5),

                  const Icon(
                    Icons.verified,
                    size: 17,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dateTimeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Date & Time',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Select when you would like the worker to arrive.',
          style: TextStyle(
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 25),

        _InfoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              OutlinedButton.icon(
                onPressed: () async {
                  await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 60),
                    ),
                    initialDate: DateTime.now(),
                  );
                },
                icon: const Icon(Icons.calendar_today_outlined),
                label: const Text('Select Date'),
              ),

              const SizedBox(height: 20),

              const Text(
                'Time',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              OutlinedButton.icon(
                onPressed: () async {
                  await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                icon: const Icon(Icons.access_time),
                label: const Text('Select Time'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _addressStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Service Address',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Where should the professional provide the service?',
          style: TextStyle(
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 25),

        _InfoCard(
          child: Column(
            children: [
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter your complete address',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  hintText: 'Additional instructions (optional)',
                  prefixIcon: Icon(Icons.notes_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _confirmationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Review Booking',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Check your booking details before confirming.',
          style: TextStyle(
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 25),

        _InfoCard(
          child: Column(
            children: [
              _SummaryRow(
                title: 'Service',
                value: widget.serviceName,
              ),
              _SummaryRow(
                title: 'Professional',
                value: widget.workerName,
              ),
              const _SummaryRow(
                title: 'Date',
                value: 'Selected date',
              ),
              const _SummaryRow(
                title: 'Time',
                value: 'Selected time',
              ),
              const _SummaryRow(
                title: 'Address',
                value: 'Your service address',
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _nextStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      // Final booking submission will be connected to Supabase later.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Booking confirmed!'),
        ),
      );
    }
  }
}

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: child,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}