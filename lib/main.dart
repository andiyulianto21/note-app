import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4enZtb3hmcHlpbGFobnd2d2hqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzk0MTEzOTMsImV4cCI6MTk5NDk4NzM5M30.irtbhZZJ-BCH4Lp6p8TU2sQKJZSr3w9DgToVuM9nZX4',
    url: "https://fxzvmoxfpyilahnwvwhj.supabase.co",
  );
  runApp(const App());
}
