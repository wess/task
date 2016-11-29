//
//  init.swift
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
  public let name              = "init"
  public let signature         = ""
  public let shortDescription  = "Creates an initial Taskfile in the current directory"

  private var today:String {
    let formatter         = DateFormatter()
    formatter.dateFormat  = "MM/dd/YY"

    return formatter.string(from: Date())
  }


  private let template = ["// Created: {DATE}",
                          "",
                          "import task",
                          "",
                          "task(\"hello\") { arguments in",
                          "",
                          "  print(\"world\")",
                          "",
                          "}",
                          "\n",]

  public func execute(arguments: CommandArguments) throws {
    let path      = Path.current + Path("Taskfile")
    let taskfile  = template.joined(separator: "\n").replacingOccurrences(of: "{DATE}", with: today)

    guard let data = taskfile.data(using: .utf8) else {
      fatalError("Unable to write initial Taskfile")
    }

    try path.write(data)
  }
}


