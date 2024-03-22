// Fixtures.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

struct SinglePropertyStruct: Hashable, Codable {
    var value: String = "SECRET_VALUE"
}

struct MultiPropertyStruct: Hashable, Codable {
    var valueA: String = "SECRET_VALUE_A"
    let valueB: Bool = false
    var _valueC: Int = -1
    var valueC: Int {
        get { _valueC }
        set { _valueC = newValue }
    }

    var valueD: String {
        "SECRET_VALUE_D"
    }
}

class SinglePropertyClass: Hashable, Codable {
    var value: String = "SECRET_VALUE"

    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(ObjectIdentifier(self))
    }

    static func == (lhs: SinglePropertyClass, rhs: SinglePropertyClass) -> Bool {
        lhs.value == rhs.value
    }
}

class SinglePropertySubClass: SinglePropertyClass {
    override init() {
        super.init()
        value = "SUBCLASS_SECRET_VALUE"
    }

    required init(from decoder: any Decoder) throws {
        try super.init(from: decoder)
    }
}

final class SinglePropertyFinalClass: Hashable, Codable {
    var value: String = "SECRET_VALUE"

    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(ObjectIdentifier(self))
    }

    static func == (lhs: SinglePropertyFinalClass, rhs: SinglePropertyFinalClass) -> Bool {
        lhs.value == rhs.value
    }
}

enum SingleCaseEnum: Hashable, Codable {
    case secret
}

enum MultiCaseEnum: Hashable, Codable {
    case secretA
    case secretB
}

enum SingleCaseAssociatedValueEnum: Hashable, Codable {
    case secret(String)
}

enum MultiCaseAssociatedValueEnum: Hashable, Codable {
    case secretA(String)
    case secretB(String)
}

@available(iOS 13, tvOS 13, macOS 10.15, watchOS 6, *)
actor SinglePropertyActor: Hashable {
    var value: String = "SECRET_VALUE"

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine("SECRET_VALUE")
    }

    static func == (_: SinglePropertyActor, _: SinglePropertyActor) -> Bool {
        true
    }
}

@available(iOS 13, tvOS 13, macOS 10.15, watchOS 6, *)
actor MultiPropertyActor: Hashable {
    var valueA: String = "SECRET_VALUE_A"
    let valueB: Bool = false
    var _valueC: Int = -1
    var valueC: Int {
        get { _valueC }
        set { _valueC = newValue }
    }

    var valueD: String {
        "SECRET_VALUE_D"
    }

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine("SECRET_VALUE_A")
        hasher.combine(false)
        hasher.combine(-1)
    }

    static func == (_: MultiPropertyActor, _: MultiPropertyActor) -> Bool {
        true
    }
}
