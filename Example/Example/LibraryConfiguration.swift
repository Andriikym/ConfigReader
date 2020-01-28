/**
*  ConfigReader Example
*  Copyright (c) Andrii Myk 2020
*  Licensed under the MIT license (see LICENSE file)
*/

import Foundation
import ConfigurationReader
import ExampleLibrary

enum LibraryConfiguration: String, ConfigurationReading {
    var bundle: Bundle { Bundle(for: ExampleLibrary.self) }
    
    case apiVersion = "API_VERSION"
    case distributionName = "DISTRIBUTION_NAME"
    case apiKey = "API_KEY"
    case accessLevel = "ACCESS_LEVEL"
}
