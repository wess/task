//
//  extensions.swift
//  task
//
//  Created by Wesley Cope on 11/28/16.
//
//

import Foundation
import SwiftCLI

extension Equatable where Self : Command {}

public func ==(lhs:Command, rhs:Command) -> Bool {
  return lhs.name.lowercased() == rhs.name.lowercased()
}
