import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_eight_second/model/experiences.dart';
import 'package:project_eight_second/services/api_service.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  final ExperienceController experienceController;

  ExperienceBloc(this.experienceController) : super(ExperienceInitial()) {
    on<LoadExperiencesEvent>((event, emit) async {
      emit(ExperienceLoading());
      try {
        // Fetch experiences using the ExperienceController
        final List<Experience> response =
            await experienceController.fetchExperiences();

        for (int i = 0; i < response.length; i++) {
          print('@@@@ path = ${response[i].imageUrl}  @@@@@');
        }

        // emit the response (which is already a List<Experience>)
        emit(ExperienceLoaded(response));
      } catch (e) {
        emit(ExperienceError('Failed to load experiences'));
      }
    });
  }
}

abstract class ExperienceEvent extends Equatable {
  const ExperienceEvent();

  @override
  List<Object> get props => [];
}

// Event for loading experiences
class LoadExperiencesEvent extends ExperienceEvent {}

// part of 'experience_bloc.dart';

abstract class ExperienceState extends Equatable {
  const ExperienceState();

  @override
  List<Object> get props => [];
}

// Initial state
class ExperienceInitial extends ExperienceState {}

// Loading state
class ExperienceLoading extends ExperienceState {}

// Loaded state with list of experiences
class ExperienceLoaded extends ExperienceState {
  final List<Experience> experiences;

  const ExperienceLoaded(this.experiences);

  @override
  List<Object> get props => [experiences];
}

// Error state
class ExperienceError extends ExperienceState {
  final String message;

  const ExperienceError(this.message);

  @override
  List<Object> get props => [message];
}
