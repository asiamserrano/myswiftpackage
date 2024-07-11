//
//  StringExtension.swift
//  autosaveProject
//
//  Created by Asia Serrano on 6/20/24.
//

import Foundation

extension String {
    
    public static var empty: Self { .init() }
    
    public static var random: Self {
        let count: Int = .random(in: 1...3)
        var set: Set<String> = .init()
        
        while set.count < count {
            if let random: String = ResourceReader.random_strings.randomElement() {
                set.insert(random.capitalized)
            }
        }
        
        return set.joined(separator: " ")
    }
    
    var trimmed: Self {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var canonicalized: Self {
        self.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined()
            .lowercased()
    }
    
    var isEmpty: Bool {
        self.canonicalized.count == 0
    }
    
    var isNotEmpty: Bool {
        self.canonicalized.count > 0
    }
    
    var pluralize: Self {
        if let last: Character = self.canonicalized.last, last != "s" {
            return "\(self)s"
        } else { return self }
    }
    
    func leftPadding(with character: Character, maxLength: Int) -> Self {
        let padding: String = String(repeating: String(character), count: maxLength)
        return padding + self
    }
    
    func rightPadding(with character: Character, maxLength: Int) -> Self {
        let count: Int = self.count
        
        if count < maxLength {
            let padding: String = String(repeating: String(character), count: maxLength - count)
            return self + padding
        } else {
            return self
        }
    }

}
