codegen:
	puro dart --disable-analytics run slang 
	puro dart  --disable-analytics run build_runner build --delete-conflicting-outputs

build-mobile:
	puro flutter build apk --split-per-abi -t "lib/mobile/main.dart"

build-desktop:
	puro flutter build web -t "lib/desktop/main.dart"