// Fixtures.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

struct SinglePropertyStruct: Hashable {
    var value: String = "SECRET_VALUE"
}

struct MultiPropertyStruct: Hashable {
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

class SinglePropertyClass: Hashable {
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
}

final class SinglePropertyFinalClass: Hashable {
    var value: String = "SECRET_VALUE"

    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(ObjectIdentifier(self))
    }

    static func == (lhs: SinglePropertyFinalClass, rhs: SinglePropertyFinalClass) -> Bool {
        lhs.value == rhs.value
    }
}

enum SingleCaseEnum: Hashable {
    case secret
}

enum MultiCaseEnum: Hashable {
    case secretA
    case secretB
}

enum SingleCaseAssociatedValueEnum: Hashable {
    case secret(String)
}

enum MultiCaseAssociatedValueEnum: Hashable {
    case secretA(String)
    case secretB(String)
}

actor SinglePropertyActor: Hashable {
    var value: String = "SECRET_VALUE"

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine("SECRET_VALUE")
    }

    static func == (_: SinglePropertyActor, _: SinglePropertyActor) -> Bool {
        true
    }
}

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
