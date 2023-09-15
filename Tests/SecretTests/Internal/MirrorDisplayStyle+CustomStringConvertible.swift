// MirrorDisplayStyle+CustomStringConvertible.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

extension Mirror.DisplayStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .class:
            return "class"
        case .collection:
            return "collection"
        case .dictionary:
            return "dictionary"
        case .enum:
            return "enum"
        case .optional:
            return "optional"
        case .set:
            return "set"
        case .struct:
            return "struct"
        case .tuple:
            return "tuple"
        @unknown default:
            return "unknown"
        }
    }
}
