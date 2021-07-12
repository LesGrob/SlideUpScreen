# SlideUpScreen

## About
Customizable slide up screen.

## Usage
### Quickstart
Create widget extends ```SlideUpScreen``` with state extends ```SlideUpScreenState```.
```dart
class TestSlideUpScreen extends SlideUpScreen {
  @override
  TestSlideUpState createState() => TestSlideUpState();
}

class TestSlideUpState extends SlideUpScreenState<TestSlideUpScreen> {
  @override
  Color get backgroundColor => Colors.white;
  @override
  Radius get topRadius => Radius.circular(24);
  @override
  double get topOffset => 100;
  @override
  double get offsetToCollapse => 120;

  @override
  Widget? bottomBlock(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.bottom + 16,
      color: Colors.white,
    );
  }

  @override
  Widget body(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 1; i < 10; i++) {
      widgets.add(Container(
        height: 40,
        color: Color.fromARGB(
            255, (150 / i).floor(), (200 / i).floor(), (255 / i).floor()),
      ));
    }
    return Column(children: widgets);
  }
}
```

Then navigate to created widget using ```BlurredPopup```.
```dart
Navigator.of(context).push(BlurredPopup.withSlideUp(screen: TestSlideUpScreen()));
```

### Customization
You can easily customize widget by overriding variables:
```dart
Color get backgroundColor => Colors.white;
``` 
- backgound of screen.

```dart
Radius get topRadius => Radius.zero;
``` 
- top radius of screen.

```dart
double get topOffset => 100;
``` 
- top offset when the widget does not fit the screen.

```dart
double get offsetToCollapse => 120;
``` 
- scroll offset to start widget collapse.

## Demo
<p align="left"><img height="600" src="https://raw.githubusercontent.com/LesGrob/SlideUpScreen/master/screenshots/SlideUpScreen-demo.gif" /></p>

## Installation
### pub.dev
SlideUpScreen is available through [pub.dev](https://pub.dev/). To install
it, simply add the following line to your dependencies in pubspec.yaml:

```yaml
slideupscreen: ^1.0.0
```