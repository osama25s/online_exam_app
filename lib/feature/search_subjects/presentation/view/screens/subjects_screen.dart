import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/feature/search_subjects/presentation/view_models/get_subjects_states.dart';
import 'package:online_exam_app/feature/search_subjects/presentation/view_models/get_subjects_view_model.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  final GetSubjectsViewModel viewModel = getIt<GetSubjectsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Survey',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: AppColors.primary , size: 25,),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.primary, width: 3),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Browse by subject title
            const Text(
              'Browse by subject',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Subjects List
            Expanded(
              child: BlocBuilder<GetSubjectsViewModel, GetSubjectsStates>(
                bloc: viewModel,
                builder: (context, state) {
                  // Loading State
                  if (state.subjectsStates.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Error State
                  if (state.subjectsStates.errorMessage != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.subjectsStates.errorMessage ??
                                'Unknown error',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => viewModel.getSubjects(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  // Success State
                  final subjects = state.subjectsStates.data ?? [];

                  if (subjects.isEmpty) {
                    return const Center(
                      child: Text(
                        'No subjects available',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: subjects.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          leading: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              subject.icon,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.book,
                                  size: 32,
                                  color: Colors.blue,
                                );
                              },
                            ),
                          ),
                          title: Text(
                            subject.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppColors.primary,
                          ),
                          onTap: () {
                            // Handle subject tap
                            // Navigator.push(...)
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade50,
    );
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }
}
