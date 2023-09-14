![FATL Logo](https://secure.meetupstatic.com/photos/event/c/2/6/c/clean_501889772.webp)
# Flutter Atlanta Packages Example
This example was used for a talk for this meetup https://www.meetup.com/flutter-atlanta/events/294871279/

## Getting Started 🚀

### Generate necessary files
```sh
$ dart run build_runner build --delete-conflicting-outputs
```

### Start the local API
```sh
$ cd api
$ npm install
$ npm run dev
```

This project contains 3 flavors, currently only development is configured:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Flutter Atlanta Packages Example works on iOS, Android, Web, and Windows._
