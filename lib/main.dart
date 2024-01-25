import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/database/hive_adapter.dart';
import 'package:test_project/database/hive_db.dart';
import 'package:test_project/theme/theme.dart';
import 'package:test_project/router/router_path.dart' as router;
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<MyHiveBox>(MyHiveBoxAdapter());

  runApp(
    const TestProject(),
  );
}

class TestProject extends StatefulWidget {
  const TestProject({super.key});

  @override
  State<TestProject> createState() => _TestProjectState();
}

class _TestProjectState extends State<TestProject> {
  @override
  void initState() {
    MyHiveBox.openBox();
    super.initState();
  }

  @override
  void dispose() {
    MyHiveBox.closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.4),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(428, 920),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test Ptoject',
          theme: AppTheme.lightTheme,
          initialRoute: '/',
          onGenerateRoute: router.generateRoute,
        ),
      ),
    );
  }
}
