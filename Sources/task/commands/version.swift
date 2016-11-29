//
//  version.swift
//  task
//
//  Created by Wesley Cope on 11/28/16.
//
//

import Foundation
import SwiftCLI
import Rainbow

public class VersionCommand : Command {
  public let name              = "version"
  public let signature         = ""
  public let shortDescription  = "Prints the current version of " + Task.name.bold

  public func execute(arguments: CommandArguments) throws {
    print(Task.name.green.bold + " Version: " + Task.version.bold)
  }
}


