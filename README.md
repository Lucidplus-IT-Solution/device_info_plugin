# device_info
<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Retrive all device info.

## Features
Supported Retriving Information about
[ :heavy_exclamation_mark:] - Not fully Stable(Some information cannot be retrived Use with caution)


- [:heavy_exclamation_mark: ] Android
- [ ] System
- [ ] Battery
- [ ] Camera
- [ ] CPU
- [ ] Display
- [ ] DRM
- [ ] Memory
- [ ] Network
- [ ] SIM
- [ ] System Files
- [ ] Thermal Info



## Installation

- Add dependencies as 
```yaml
  multi_form_builder:
    git:
      url: https://github.com/Shreemanarjun/multi_form_builder.git
      ref: main
```
## Usage

- First import the library
```dart
import 'package:multi_form_builder/multi_form_builder.dart';
```
- Initialize a page controller
```dart
 final PageController pageController = PageController();
```
- Example

```dart
MultiFormBuilder(
          onPageChanged: (int currentpage) {
            debugPrint('current page: $currentpage');
          },
          onLastPage: () {
            debugPrint('last page got');
          },
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            return MyWidget(text: 'Page $index');
          },
          itemCount: 3,
          indicatorWidget: (context, totalItems) {
            return SmoothPageIndicator(
              controller: pageController, // PageController
              count: totalItems, // total number of pages
              effect: const SlideEffect(), // your preferred effect
              onDotClicked: (int dotindex) {
                pageController.jumpToPage(dotindex);
              },
            );
          },
        ),
```

## Features that will be added 
- [x] Added basic multi form builder with support of customization of indicator widget and page widgets will only build when on view
- [ ] To Add Auto Form Builder that will fit to the current view automatically and create number of pages according to that.Also will add more customization like, to add widgets on the **``last ``**,**``intermidiate ``**,**``first ``** pages.
- [ ] To publish on pub.dev

