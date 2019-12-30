/**
*  ConfigReader
*  Copyright (c) Andrii Myk 2020
*  Licensed under the MIT license (see LICENSE file)
*/

import Foundation

public struct ConfigurationReader {
    enum Error: Swift.Error, LocalizedError {
        case noKey(String)
        case invalidValue
        
        var errorDescription: String? {
            switch self {
            case .noKey(let key):
                return "There is no key \(key) in .plist file"
            case .invalidValue:
                return "Can not read value"
            }
        }
    }

    public static func value<T>(for key: String, bundle: Bundle) throws -> T where T: LosslessStringConvertible {
        guard let object = bundle.object(forInfoDictionaryKey: key) else {
            throw Error.noKey(key)
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }

    public static func value<T, Key: RawRepresentable>(for key: Key, bundle: Bundle = .main) throws -> T where T: LosslessStringConvertible, Key.RawValue == String {
        try value(for: key.rawValue, bundle: bundle)
    }
}
