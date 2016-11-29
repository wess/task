//
//  setup.swift
//  Task
//
//  Created by Wesley Cope on 11/28/16.
//
//

import Foundation
import SwiftCLI
import PathKit
import Rainbow

public class InitCommand : Command {
  public let name              = "setup"
  public let signature         = ""
  public let shortDescription  = "Initial setup or update for Task"

  public func execute(arguments: CommandArguments) throws {
    let path      = Path.current + Path("Taskfile")
    let taskfile  = template.joined(separator: "\n").replacingOccurrences(of: "{DATE}", with: today)

    guard let data = taskfile.data(using: .utf8) else {
      fatalError("Unable to write initial Taskfile")
    }

    try path.write(data)
  }
}


