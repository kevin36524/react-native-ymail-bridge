
# react-native-ymail-bridge

## Getting started

`$ npm install react-native-ymail-bridge --save`

### Mostly automatic installation

`$ react-native link react-native-ymail-bridge`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ymail-bridge` and add `RNYmailBridge.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNYmailBridge.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNYmailBridgePackage;` to the imports at the top of the file
  - Add `new RNYmailBridgePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-ymail-bridge'
  	project(':react-native-ymail-bridge').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-ymail-bridge/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-ymail-bridge')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNYmailBridge.sln` in `node_modules/react-native-ymail-bridge/windows/RNYmailBridge.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Ymail.Bridge.RNYmailBridge;` to the usings at the top of the file
  - Add `new RNYmailBridgePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNYmailBridge from 'react-native-ymail-bridge';

// TODO: What to do with the module?
RNYmailBridge;
```
  