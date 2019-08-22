// ----------------------------------------------------------------------
// File generated by NStack Translations Generator.
//
// Copyright (c) 2018 Nodes ApS
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
import TranslationManager

public final class SKTranslations: LocalizableModel {
    public var oneMoreSection = OneMoreSection()
    public var defaultSection = DefaultSection()
    public var otherSection = OtherSection()

    enum CodingKeys: String, CodingKey {
        case oneMoreSection
        case defaultSection = "default"
        case otherSection
    }

    public override init() { super.init() }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        oneMoreSection = try container.decodeIfPresent(OneMoreSection.self, forKey: .oneMoreSection) ?? oneMoreSection
        defaultSection = try container.decodeIfPresent(DefaultSection.self, forKey: .defaultSection) ?? defaultSection
        otherSection = try container.decodeIfPresent(OtherSection.self, forKey: .otherSection) ?? otherSection
    }

    public override subscript(key: String) -> LocalizableSection? {
        switch key {
        case CodingKeys.oneMoreSection.stringValue: return oneMoreSection
        case CodingKeys.defaultSection.stringValue: return defaultSection
        case CodingKeys.otherSection.stringValue: return otherSection
        default: return nil
        }
    }

    public final class OneMoreSection: LocalizableSection {
        public var soManyKeys = ""
        public var test1 = ""
        public var test2 = ""

        enum CodingKeys: String, CodingKey {
            case soManyKeys
            case test1
            case test2
        }

        public override init() {
            super.init()
            soManyKeys = "\(classNameLowerCased()).soManyKeys"
            test1 = "\(classNameLowerCased()).test1"
            test2 = "\(classNameLowerCased()).test2"
        }

        public required init(from decoder: Decoder) throws {
            super.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
            soManyKeys = try container.decodeIfPresent(String.self, forKey: .soManyKeys) ?? "__soManyKeys"
            test1 = try container.decodeIfPresent(String.self, forKey: .test1) ?? "__test1"
            test2 = try container.decodeIfPresent(String.self, forKey: .test2) ?? "__test2"
        }

        public override subscript(key: String) -> String? {
            return ""
        }
    }

    public final class DefaultSection: LocalizableSection {
        public var emptyKey = ""
        public var keyys = ""
        public var successKey = ""

        enum CodingKeys: String, CodingKey {
            case emptyKey
            case keyys
            case successKey
        }

        public override init() {
            super.init()
            emptyKey = "\(classNameLowerCased()).emptyKey"
            keyys = "\(classNameLowerCased()).keyys"
            successKey = "\(classNameLowerCased()).successKey"
        }

        public required init(from decoder: Decoder) throws {
            super.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
            emptyKey = try container.decodeIfPresent(String.self, forKey: .emptyKey) ?? "__emptyKey"
            keyys = try container.decodeIfPresent(String.self, forKey: .keyys) ?? "__keyys"
            successKey = try container.decodeIfPresent(String.self, forKey: .successKey) ?? "__successKey"
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

