//
//  ResourceReader.swift
//  autosaveProject
//
//  Created by Asia Serrano on 5/30/24.
//

import Foundation

public class ResourceReader {
    
//    enum Files: String {
////        case series = "series.txt"
//        case image = "image.txt"
////        case genre = "genre.txt"
//    }
    
    public static var random_strings: [String] {
        getFileContent("random-words.txt").components(separatedBy: "\n")
    }
    
    static func getFileContent(_ file: String) -> String {
//        let val: String = f.rawValue
        do {
            let bundlePath: String = Bundle.main.path(forResource: file, ofType: nil) ?? .init()
            return try String(contentsOfFile: bundlePath).trimmed
        } catch {
            fatalError("Cannot find resource: \(file)")
        }
    }
    
//    static func readArray(_ f: Files) -> [String] {
//        Self.readString(f).split(separator: "\n").map { $0.description }
//    }
    
}
