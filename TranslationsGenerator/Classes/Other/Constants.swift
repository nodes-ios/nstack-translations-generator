//
//  Constants.swift
//  nstack-translations-generator
//
//  Created by Bob De Kort on 08/08/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

struct Constants {
    enum ErrorDomain: String {
        case tGenerator = "com.nodes.translations-generator"
        case sktGenerator = "com.nodes.sk-translations-generator"
    }
    
    enum ModelName: String {
        case tGenerator = "Translations"
        case sktGenerator = "SKTranslations"
    }
    
    static func errorDomainFor(_ generator: Generator) -> String {
        switch generator {
        case is TGenerator:     return ErrorDomain.tGenerator.rawValue
        case is SKTGenerator:   return ErrorDomain.sktGenerator.rawValue
        default:                return ""
        }
    }
    
    static func modelNameFor(_ generator: Generator) -> String {
        switch generator {
        case is TGenerator:     return ModelName.tGenerator.rawValue
        case is SKTGenerator:   return ModelName.sktGenerator.rawValue
        default:                return ""
        }
    }
}
