import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
  ..._valueProviders,
  ...sharedProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[];

List<SingleChildWidget> _valueProviders = <SingleChildWidget>[];

List<SingleChildWidget> sharedProviders = <SingleChildWidget>[];
