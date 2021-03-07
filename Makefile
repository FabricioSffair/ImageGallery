setup:
	sudo gem install xcpretty
	pod install
clean-derived-data:
	rm -rf ~/Library/Developer/Xcode/DerivedData
clean:
	xcodebuild clean -workspace imageGallery.xcworkspace -scheme imageGallery | xcpretty
build:
	xcodebuild build -workspace imageGallery.xcworkspace -scheme imageGallery | xcpretty
build-and-test:
	xcodebuild -workspace imageGallery.xcworkspace -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11,OS=14.4' -scheme imageGallery test | xcpretty
check:	clean build-and-test