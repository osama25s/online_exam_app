import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/feature/search_subjects/domain/entitys/subject_entity.dart';

class GetSubjectsStates {
  BaseState<List<SubjectEntity>> subjectsStates;

  GetSubjectsStates({BaseState<List<SubjectEntity>>? subjectsStates})
    : subjectsStates = subjectsStates ?? BaseState<List<SubjectEntity>>();

  GetSubjectsStates copyWith({BaseState<List<SubjectEntity>>? subjectsStates}) {
    return GetSubjectsStates(
      subjectsStates: subjectsStates ?? this.subjectsStates,
    );
  }
}
