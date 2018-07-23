# react-native-static-libs
Pod containing react-native static Libraries


## Adding new RN native library
1. Add new npm package to package.json inside "reactNativeBundle" folder.
```
npm install <package>@version --save
```
2. Once installed successfully, open xcode and file finder, look for "*.xcodeproj" file of newly installed package 
inside "node_modules" directory.
3. Drag and Drop "*.xcodeproj" to xcode's "Libraries" folder.
E.g. "RNCalendarEvents.xcodeproj"

<img width="966" alt="screen shot 2018-07-21 at 3 47 26 pm" src="https://git.ouroath.com/storage/user/1278/files/606e83f0-8cff-11e8-8030-7b4f2a02cede">

4. Now, create new target (aggregate) for that project which would create static library for this project, name it "fat<PACKAGE_NAME>".

<img width="736" alt="screen shot 2018-07-21 at 4 09 59 pm" src="https://git.ouroath.com/storage/user/1278/files/a9041f48-8d00-11e8-863b-eaed1fd60b94">

5. In "Build Phases", add new Run script, with following command or you can copy from existing targets of native libs:

```
# define output folder environment variable, check source root under node_modules.
UNIVERSAL_OUTPUTFOLDER=${SOURCE_ROOT}/../../../../${CONFIGURATION}-universal
PRODUCT_NAME=<PackageName>

# Step 1. Build Device and Simulator versions
xcodebuild -target ${PRODUCT_NAME} ONLY_ACTIVE_ARCH=NO -configuration ${CONFIGURATION} -sdk iphoneos  BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}"
xcodebuild -target ${PRODUCT_NAME} -configuration ${CONFIGURATION} -sdk iphonesimulator -arch x86_64 BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}"

# make sure the output directory exists
mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"

# Step 2. Create universal binary file using lipo
lipo -create -output "${UNIVERSAL_OUTPUTFOLDER}/lib${PROJECT_NAME}.a" "${BUILD_DIR}/${CONFIGURATION}-iphoneos/lib${PROJECT_NAME}.a" "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/lib${PROJECT_NAME}.a"

# Last touch. copy the header files. Just for convenience
cp -R "${BUILD_DIR}/${CONFIGURATION}-iphoneos/include" "${UNIVERSAL_OUTPUTFOLDER}/"

```
6. Now, run the target with "Release" build configuration.

7. You might get build errors, due to following:
    1. Sometimes you need to change how header files are included in ".h", e.g. 
        ```
        #import <React/RCTBridgeModule.h>  needs to be changed to #import "RCTBridgeModule.h"
        ```
    2. Sometimes it might be looking for header files from ReactNative which is not present in <ROOT>/include folder, find that  header file from "node_modules" react-native directory and copy to "include" dirrectory which containes headers files to compile and build. *This step requires that you first build React native to update "libReact.a"*, then build new static library again. 
 
 8. If you happen to update "libReact.a", then build it for both release and debug configuration.
 
 9. Now check following before commiting:
      1. You should have got new lib< package >.a inside "reactNativeBundle/Release-universal/" directory and updated libReact.a (only if you have build it again)
      2. Updated libReact.a inside "reactNativeBundle/Debug-universal/" (only if you have build it again)
      3. package.json updated, with new package under "node_modules" (we need to commit this as well as xcodeproject file is under that)
      4. Try using this project under your existing Example app and see whether this new Static library is working as per your requirement. E.g. for Calendar, you are able to fetch events or if you have added maps then check maps features are working fine or not. 
      5. Bump version in podspec of both YMReactNativeStaticLibs and YMReactNativeStaticLibs-debug.
      
10. Once comitted, create new release with version specified in podspec.
  
## Updating existing RN native library
  
1. Upgrade npm package inside "reactNativeBundle" folder.
```
npm install <package>@version --save
```
Now follow same steps above from 7-9.



  
  
 
  




