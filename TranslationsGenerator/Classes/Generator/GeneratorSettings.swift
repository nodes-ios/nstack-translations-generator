//
//  GeneratorSettings.swift
//  nstack-translations-generator
//
//  Created by Dominik Hádl on 08/02/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation

public struct GeneratorSettings {
    public var plistPath: String?
    public var keys: (appID: String, appKey: String)?
    public var outputPath: String?
    public var flatTranslations: Bool
    public var availableFromObjC: Bool
    
    public init(plistPath: String?,
                keys: (appID: String, appKey: String)?,
                outputPath: String?,
                flatTranslations: Bool,
                availableFromObjC: Bool) {
        self.plistPath = plistPath
        self.keys = keys
        self.outputPath = outputPath
        self.flatTranslations = flatTranslations
        self.availableFromObjC = availableFromObjC
    }
}

extension GeneratorSettings {
    static func parseFromArguments(_ arguments: [String]) throws -> GeneratorSettings {
        if arguments.count < 5 || arguments.count > 9 {
            throw NSError(domain: Generator.errorDomain, code: ErrorCode.wrongArguments.rawValue,
                userInfo: [NSLocalizedDescriptionKey : "Error, wrong number of arguments passed."])
        }

        // Parse arguments
        var lastKey = ""
        var parsedArguments = [String: [String]]()
        for arg in arguments {
            if arg.hasPrefix("-") {
                parsedArguments[arg] = []
                lastKey = arg
            } else {
                parsedArguments[lastKey]?.append(arg)
            }
        }

        var outputPath: String?
        var plistPath: String?
        var keys: (appID: String, appKey: String)?
        var flatTranslations = false
        var availableFromObjC = false

        // Get output path if present
        if let path = parsedArguments["-output"]?.first {
            outputPath = path
        }

        // Get plist path if present
        if let plistPaths = parsedArguments["-plist"] , plistPaths.count == 1 {
            plistPath = plistPaths[0]
        }

        // Get keys if present
        if let keysArray = parsedArguments["-keys"] , keysArray.count == 2 {
            keys = (keysArray[0], keysArray[1])
        }

        // Check if we have keys
        if plistPath == nil && (keys?.appKey == nil || keys?.appID == nil) {
            throw NSError(domain: Generator.errorDomain, code: ErrorCode.wrongArguments.rawValue,
                userInfo: [NSLocalizedDescriptionKey : "No or multiple plist paths, or wrong keys format."])
        }

        if let flat = parsedArguments["-flat"] , flat.count == 1 && flat[0] == "1" {
            flatTranslations = true
        }
        
        if let _ = parsedArguments["-use-objc"] {
            availableFromObjC = true
        }

        return GeneratorSettings(plistPath: plistPath, keys: keys, outputPath: outputPath, flatTranslations: flatTranslations, availableFromObjC: availableFromObjC)
    }

    func downloaderSettings() throws -> DownloaderSettings {
        if let keys = keys {
            return DownloaderSettings(appID: keys.appID, appKey: keys.appKey, flatTranslations: self.flatTranslations)
        } else if let plistPath = plistPath {
            return try DownloaderSettings.settingsFromConfigurationFile(plistPath: plistPath)
        }
        throw NSError(domain: Generator.errorDomain, code: ErrorCode.generatorError.rawValue,
            userInfo: [NSLocalizedDescriptionKey : "Couldn't generate downloader settings from arguments."])
    }
}