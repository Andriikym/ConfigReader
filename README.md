<p align="left">
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>


# ConfigurationReader

This package inspired by Mattt's article [Xcode Build Configuration Files](https://nshipster.com/xcconfig). I recommend to read it first to refresh understanding of configurations in Xcode.

The idea is that best practices [prescribe](https://12factor.net/config) strict separation of configuration from code. (For example endpoint URLs for production and staging environments). Despite that all such stuff usually perfectly well works with conditional compilation statements like DEBUG, such an approach runs afoul of the canon of code/configuration separation. Thus, let's follow the canons.

There are two simple ways of doing so:
- using Xcode project User-Defined Settings;
- using of configuration files;

Please refer to the repository **Example** folder to get example.

### *Pre-setup*

Firstly create build configurations upon your needs.
![Imagg](../assets/scr0.png)

Then setup build schemas and connect them with appropriate configurations.

![Imagg](../assets/scr1.png)

## User-Defined Settings approach

This approach is a bit simpler because it is not necessary to create configuration files and manage them later.
Just create settings to reflect your requirements

![Imagg](../assets/scr2.png)

In the example they are looks like so:
![Imagg](../assets/scr3.png)


Then connect them in the apps's Info.plist file, to make correct values copied to the resulting app bundle during compilation.

![Imagg](../assets/scr4.png)

## Configuration files approach

In that case you need to create *.xcconfig* files via Xcode's "File -> New File" and select Configuration Settings File there.
Put them somewhere in project directory.

![Imagg](../assets/scr5.png)

and connect with corresponding build configurations.

![Imagg](../assets/scr6.png)

Then connect them in the apps's Info.plist file as in previous approach.
In the example app the *Example Library* uses configuration files.

## Usage

To get started with ConfigurationReader, all you have to do is to import it.
Then, if desired, you can use its static methods directly.

Or you can create swift unum and confirm it to *String* and *ConfigurationReading*.
Name key's raw values as items in configuration.

```swift
import ConfigurationReader

enum Configuration: String, ConfigurationReading {
    case hostURL = "HOST_URL"
    case bridgeURL = "BRIDGE_URL"
    case contanerID = "CONTAINER_IDENTIFIER"
}
```

it allows reading configuration values in an error-free way.

```swift
let hostURL = Configuration.hostURL.stringValue
let bridgeURL = Configuration.bridgeURL.stringValue
let identifier = Configuration.contanerID.stringValue
```

And the values will correspond to current build configuration selected by build schema and changes appropriately.

If values from bundle another than ***main*** needed, you need to provide corresponding one by overloading the *bundle* property of configuration enum.
```swift
import ConfigurationReader
import ExampleLibrary

enum LibraryConfiguration: String, ConfigurationReading {
    var bundle: Bundle { Bundle(for: ExampleLibrary.self) }

    case apiVersion = "API_VERSION"
    case distributionName = "DISTRIBUTION_NAME"
    case apiKey = "API_KEY"
    case accessLevel = "ACCESS_LEVEL"
}
```

Thus configuration will be separated from code. Profit.

## Installation

The easiest way is to copy/paste ConfigurationReader source to your main codebase.

If you like to use Swift Package Manager, ConfigurationReader can be installed by simply adding it via Xcode’s *Swift Packages* option within the File menu or project's *Swift Packages* tab. (Both starting with Xcode 11).

Or add it directly as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/Andriikym/ConfigurationReader.git", from: "0.1.0")
    ],
    ...
)
```

Hope it will be useful 😀
