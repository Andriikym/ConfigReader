/**
*  ConfigReader
*  Copyright (c) Andrii Myk 2020
*  Licensed under the MIT license (see LICENSE file)
*/

import Foundation

public protocol ConfigurationReading: RawRepresentable where RawValue == String {
    var bundle: Bundle { get }
    
    var stringValue: String { get }
    var intValue: Int { get }
    var doubleValue: Double { get }
}

public extension ConfigurationReading {
    var bundle: Bundle { Bundle.main }
       
    var stringValue: String {
        getValue()
    }
    
    var intValue: Int {
        getValue()
    }
    
    var doubleValue: Double {
        getValue()
    }
    
    private func getValue<T: LosslessStringConvertible>() -> T {
        do {
            return try ConfigurationReader.value(for: self.rawValue, bundle: bundle)
        } catch  {
            fatalError(error.localizedDescription)
        }
    }
}
