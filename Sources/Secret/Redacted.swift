// Redacted.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

/// A property wrapper that helps avoid accidental leaking of the underlying value by replacing it with its hash value.
///
/// ``Redacted`` hides the ``wrappedValue``by replacing it with "REDACTED". It works against reflection
/// via ``Mirror``, string conversion via ``CustomStringConvertible``/``CustomDebugStringConvertible``,
/// and by default when encoding with an ``Encoder``.
@propertyWrapper
public struct Redacted<T> {
    /// The value that is being obscured with "REDACTED"
    public var wrappedValue: T
    /// Enabled by default, when encoding, replace the ``wrappedValue`` with "REDACTED".
    public let obscureEncoding: Bool

    public init(_ wrappedValue: T, obscureEncoding: Bool = true) {
        self.wrappedValue = wrappedValue
        self.obscureEncoding = obscureEncoding
    }
}

private let placeholder: StaticString = #"REDACTED"#

extension Redacted: CustomReflectable {
    public var customMirror: Mirror {
        let _mirror = Mirror(reflecting: wrappedValue)
        let children = _mirror.children.map { child in
            (label: child.label, value: placeholder.description)
        }
        let mirror = Mirror(
            wrappedValue,
            children: Mirror.Children(children)
        )
        return mirror
    }
}

extension Redacted: CustomStringConvertible {
    public var description: String {
        placeholder.description
    }
}

extension Redacted: CustomDebugStringConvertible {
    public var debugDescription: String {
        "\(T.self): \(placeholder.description)"
    }
}

extension Redacted: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        if obscureEncoding {
            try placeholder.description.encode(to: encoder)
        } else {
            try wrappedValue.encode(to: encoder)
        }
    }
}

extension Redacted: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        try self.init(T(from: decoder))
    }
}

#if canImport(Foundation)
    import Foundation

    @available(iOS 15, macCatalyst 15, macOS 12, tvOS 15, watchOS 8, visionOS 1, *)
    extension Redacted: EncodableWithConfiguration where T: EncodableWithConfiguration {
        public func encode(to encoder: Encoder, configuration: T.EncodingConfiguration) throws {
            if obscureEncoding {
                try placeholder.description.encode(to: encoder)
            } else {
                try wrappedValue.encode(to: encoder, configuration: configuration)
            }
        }
    }

    @available(iOS 15, macCatalyst 15, macOS 12, tvOS 15, watchOS 8, visionOS 1, *)
    extension Redacted: DecodableWithConfiguration where T: DecodableWithConfiguration {
        public init(from decoder: Decoder, configuration: T.DecodingConfiguration) throws {
            try self.init(T(from: decoder, configuration: configuration))
        }
    }

#endif

extension Redacted: Equatable where T: Equatable {}

extension Redacted: Hashable where T: Hashable {
    /// ``Redacted`` is meant to be as transparent as possible so its hash value will be that of the ``wrappedValue``.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}

extension Redacted: Sendable where T: Sendable {}

@available(iOS 13, macCatalyst 13, macOS 10.15, tvOS 13, watchOS 6, visionOS 1, *)
extension Redacted: Identifiable where T: Identifiable {
    public var id: T.ID { wrappedValue.id }
}
