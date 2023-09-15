// Hashed.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

/// A property wrapper that helps avoid accidental leaking of the underlying value by replacing it with its hash value.
///
/// ``Hashed`` hides the ``wrappedValue``by replacing it with a hash of the value. It works against reflection
/// via ``Mirror``, string conversion via ``CustomStringConvertible``/``CustomDebugStringConvertible``,
/// and by default when encoding with an ``Encoder``.
@propertyWrapper
public struct Hashed<T>: Hashable where T: Hashable {
    /// The value that is being obscured with its hash value
    public var wrappedValue: T
    /// Enabled by default, when encoding, replace the ``wrappedValue`` with its hash.
    public let obscureEncoding: Bool

    public init(_ wrappedValue: T, obscureEncoding: Bool = true) {
        self.wrappedValue = wrappedValue
        self.obscureEncoding = obscureEncoding
    }

    /// ``Hashed`` is meant to be as transparent as possible so its hash value will be that of the ``wrappedValue``.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}

extension Hashed: CustomReflectable {
    public var customMirror: Mirror {
        let mirror = Mirror(
            wrappedValue,
            children: Mirror.Children([(
                label: "hashValue",
                value: wrappedValue.hashValue
            )])
        )
        return mirror
    }
}

extension Hashed: CustomStringConvertible {
    public var description: String {
        wrappedValue.hashValue.description
    }
}

extension Hashed: CustomDebugStringConvertible {
    public var debugDescription: String {
        "\(T.self): \(wrappedValue.hashValue.description)"
    }
}

extension Hashed: Sendable where T: Sendable {}

extension Hashed: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        if obscureEncoding {
            try wrappedValue.hashValue.encode(to: encoder)
        } else {
            try wrappedValue.encode(to: encoder)
        }
    }
}

extension Hashed: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        try self.init(T(from: decoder))
    }
}

#if canImport(Foundation)
    import Foundation

    @available(iOS 15, macCatalyst 15, macOS 12, tvOS 15, watchOS 8, visionOS 1, *)
    extension Hashed: EncodableWithConfiguration where T: EncodableWithConfiguration {
        public func encode(to encoder: Encoder, configuration: T.EncodingConfiguration) throws {
            if obscureEncoding {
                try wrappedValue.hashValue.encode(to: encoder)
            } else {
                try wrappedValue.encode(to: encoder, configuration: configuration)
            }
        }
    }

    @available(iOS 15, macCatalyst 15, macOS 12, tvOS 15, watchOS 8, visionOS 1, *)
    extension Hashed: DecodableWithConfiguration where T: DecodableWithConfiguration {
        public init(from decoder: Decoder, configuration: T.DecodingConfiguration) throws {
            try self.init(T(from: decoder, configuration: configuration))
        }
    }

#endif

@available(iOS 13, macCatalyst 13, macOS 10.15, tvOS 13, watchOS 6, visionOS 1, *)
extension Hashed: Identifiable where T: Identifiable {
    /// ``Hashed`` is meant to be as transparent as possible so it will automatically
    /// passthrough ``wrappedValue``s ``Identifiable`` conformance.
    public var id: T.ID { wrappedValue.id }
}
