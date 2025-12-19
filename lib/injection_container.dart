import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'features/todo/data/datasources/task_local_datasource.dart';
import 'features/todo/data/models/task_model.dart';
import 'features/todo/data/repositories/task_repository_impl.dart';
import 'features/todo/domain/repositories/task_repository.dart';
import 'features/todo/domain/usecases/add_task.dart';
import 'features/todo/domain/usecases/delete_task.dart';
import 'features/todo/domain/usecases/get_taskts.dart';
import 'features/todo/domain/usecases/toggle_task.dart';
import 'features/todo/domain/usecases/update_task.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // Hive box (already opened in main)
  sl.registerLazySingleton<Box<TaskModel>>(() => Hive.box<TaskModel>('tasks'));

  // Data sources
  sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()));

  // Usecases
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => ToggleTask(sl()));
}
