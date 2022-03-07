


// @UseMoor(tables: [Users], daos: [AuthenticationDao])
// class LocalDatabaseConfig extends _$LocalDatabaseConfig {
//   LocalDatabaseConfig()
//       : super((FlutterQueryExecutor.inDatabaseFolder(
//     path: 'heroshe.db',
//     logStatements: !kReleaseMode,
//   )));
//
//   @override
//   int get schemaVersion => 1;
//
//   @override
//   MigrationStrategy get migration {
//     return MigrationStrategy(onCreate: (Migrator m) {
//       return m.createAll();
//     });
//   }
// }