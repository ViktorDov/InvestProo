import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/application.dart';
import 'presentation/constants/supabase_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SupabaseKey.supabaseUrl, anonKey: SupabaseKey.supabaseKey);
  runApp(const Application());
}
