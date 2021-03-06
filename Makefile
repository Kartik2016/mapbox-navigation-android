checkstyle:
	./gradlew checkstyle

test:
	# See libandroid-navigation/build.gradle for details
	./gradlew :libandroid-navigation:test
	./gradlew :libandroid-navigation-ui:test

build-release:
	./gradlew :libandroid-navigation:assembleRelease
	./gradlew :libandroid-navigation-ui:assembleRelease

javadoc:
	./gradlew :libandroid-navigation:javadocrelease
	./gradlew :libandroid-navigation-ui:javadocrelease

publish:
	export IS_LOCAL_DEVELOPMENT=false; ./gradlew :libandroid-navigation:uploadArchives
	export IS_LOCAL_DEVELOPMENT=false; ./gradlew :libandroid-navigation-ui:uploadArchives

publish-local:
	# This publishes to ~/.m2/repository/com/mapbox/mapboxsdk
	export IS_LOCAL_DEVELOPMENT=true; ./gradlew :libandroid-navigation:uploadArchives
	export IS_LOCAL_DEVELOPMENT=true; ./gradlew :libandroid-navigation-ui:uploadArchives

dex-count:
	./gradlew countDebugDexMethods
	./gradlew countReleaseDexMethods

navigation-fixtures:
	# Navigation: Taylor street to Page street
	curl "https://api.mapbox.com/directions/v5/mapbox/driving/-122.413165,37.795042;-122.433378,37.7727?geometries=polyline6&overview=full&steps=true&access_token=$(MAPBOX_ACCESS_TOKEN)" \
		-o libandroid-navigation/src/test/res/navigation.json

	# Directions: polyline geometry with precision 5
	curl "https://api.mapbox.com/directions/v5/mapbox/driving/-122.416667,37.783333;-121.900000,37.333333?geometries=polyline&steps=true&access_token=$(MAPBOX_ACCESS_TOKEN)" \
		-o libandroid-navigation/src/test/res/directions_v5.json
