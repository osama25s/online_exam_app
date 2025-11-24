import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/get_all_exams_on_subject/domain/entities/exam_entity.dart';

class GetExamsStates {
  BaseState<List<ExamEntity>> examsState;

  GetExamsStates({BaseState<List<ExamEntity>>? examsState})
    : examsState = examsState ?? BaseState<List<ExamEntity>>();

  GetExamsStates copyWith({BaseState<List<ExamEntity>>? examsState}) {
    return GetExamsStates(examsState: examsState ?? this.examsState);
  }
}
