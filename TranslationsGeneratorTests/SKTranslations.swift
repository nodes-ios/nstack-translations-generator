// ----------------------------------------------------------------------
// File generated by NStack Translations Generator.
//
// Copyright (c) 2019 Nodes ApS
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// ----------------------------------------------------------------------

import Foundation
import NStackSDK
import TranslationManager

public var skt: SKTranslations {
    return SKTranslations()
}

public final class SKTranslations: LocalizableModel {
    public var defaultSection = DefaultSection()
    public var oneMoreSection = OneMoreSection()
    public var otherSection = OtherSection()

    enum CodingKeys: String, CodingKey {
        case defaultSection = "default"
        case oneMoreSection
        case otherSection
    }

    public override init() { super.init() }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultSection = try container.decodeIfPresent(DefaultSection.self, forKey: .defaultSection) ?? defaultSection
        oneMoreSection = try container.decodeIfPresent(OneMoreSection.self, forKey: .oneMoreSection) ?? oneMoreSection
        otherSection = try container.decodeIfPresent(OtherSection.self, forKey: .otherSection) ?? otherSection
    }

    public override subscript(key: String) -> LocalizableSection? {
        switch key {
        case CodingKeys.defaultSection.stringValue: return defaultSection
        case CodingKeys.oneMoreSection.stringValue: return oneMoreSection
        case CodingKeys.otherSection.stringValue: return otherSection
        default: return nil
        }
    }

    public final class DefaultSection: LocalizableSection {
        public var keyys = ""
        public var successKey = ""
        public var emptyKey = ""

        enum CodingKeys: String, CodingKey {
            case keyys
            case successKey
            case emptyKey
        }

        public override init() {
            super.init()
            keyys = "\(classNameLowerCased()).keyys"
            successKey = "\(classNameLowerCased()).successKey"
            emptyKey = "\(classNameLowerCased()).emptyKey"
        }

        public required init(from decoder: Decoder) throws {
            super.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
            keyys = try container.decodeIfPresent(String.self, forKey: .keyys) ?? "__keyys"
            successKey = try container.decodeIfPresent(String.self, forKey: .successKey) ?? "__successKey"
            emptyKey = try container.decodeIfPresent(String.self, forKey: .emptyKey) ?? "__emptyKey"
        }

        public override subscript(key: String) -> String? {
            return ""
        }
    }

    public final class OneMoreSection: LocalizableSection {
        public var test1 = ""
        public var soManyKeys = ""
        public var testURL = ""
        public var test2 = ""

        enum CodingKeys: String, CodingKey {
            case test1
            case soManyKeys
            case testURL
            case test2
        }

        public override init() {
            super.init()
            test1 = "\(classNameLowerCased()).test1"
            soManyKeys = "\(classNameLowerCased()).soManyKeys"
            testURL = "\(classNameLowerCased()).testURL"
            test2 = "\(classNameLowerCased()).test2"
        }

        public required init(from decoder: Decoder) throws {
            super.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
            test1 = try container.decodeIfPresent(String.self, forKey: .test1) ?? "__test1"
            soManyKeys = try container.decodeIfPresent(String.self, forKey: .soManyKeys) ?? "__soManyKeys"
            testURL = try container.decodeIfPresent(String.self, forKey: .testURL) ?? "__testURL"
            test2 = try container.decodeIfPresent(String.self, forKey: .test2) ?? "__test2"
        }

        public override subscript(key: String) -> String? {
            return ""
        }
    }

    public final class OtherSection: LocalizableSection {
        public var otherString = ""

        enum CodingKeys: String, CodingKey {
            case otherString
        }

        public override init() {
            super.init()
            otherString = "\(classNameLowerCased()).otherString"
        }

        public required init(from decoder: Decoder) throws {
            super.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
            otherString = try container.decodeIfPresent(String.self, forKey: .otherString) ?? "__otherString"
        }

        public override subscript(key: String) -> String? {
            return ""
        }
    }
}

