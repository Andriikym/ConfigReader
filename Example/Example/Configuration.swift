/**
*  ConfigReader Example
*  Copyright (c) Andrii Myk 2020
*  Licensed under the MIT license (see LICENSE file)
*/

import Foundation
import ConfigurationReader
import ExampleLibrary

enum Configuration: String, ConfigurationReading {
    case hostURL = "HOST_URL"
    case bridgeURL = "BRIDGE_URL"
    case contanerID = "CONTAINER_IDENTIFIER"
}
