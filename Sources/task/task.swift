//
//  task.swift
//  task
//
//  Created by Wesley Cope on 11/28/16.
//
//

import Foundation
import SwiftCLI
import Rainbow

public class Task {
  static let name     = "task"
  static let version  = "0.0.1"
  static let desc     = "Commandline tool for running tasks"


  private lazy var versionCommand:VersionCommand  = VersionCommand()
  private lazy var initCommand:InitCommand        = InitCommand()

  public init() {
    CLI.setup(name: Task.name, version: Task.version, description: Task.desc)

    setupCommands()
    setupAliases()
  }

    func setupCommands() {
      CLI.versionCommand = versionCommand
      
      CLI.register(command: initCommand)
    }

    func setupAliases() {
    }

    func run() {
      exit(CLI.go())
    }
}


// import Foundation
// import PathKit

// enum TaskError {
//   case invalidPath
//   case invalidFile
// }

// class Task {
//   let path:Path
//   let taskfile:String
//   let output:Path


//   init(_ path:String) throws {
//     self.path = Path(path) + Path("Taskfile")

//     do {
//       let data = try self.path.read()

//       guard let taskfileString = String(data: data, encoding: .utf8) else {
//         throw TaskError.invalidPath
//       }
//     } catch {
//       throw TaskError.invalidFile
//     }
//   }

//   func generate(from taskfile:String, task:String, arguments:[String] = []) -> String {
//     let args    = "[" + arguments.joined(separator: ",") + "]"
//     let header  = "#!/usr/bin/env swift\nimport Foundation\n"
//     let tasks   = taskfile.replacingOccurrences(of: "import Foundation", with: "").replacingOccurrences(of: "import task", with: taskSwift)
//     let footer  = taskFooter.replacingOccurrences(of: "{#name}", with: task).replacingOccurrences(of: "{#args}", with: args)

//     return (header + tasks + footer)
//   }

//   @discardableResult
//   func exec(_ arguments:[String]) -> String? {
//     let pipe                = Pipe()
//     let process             = Process()
//     process.launchPath      = "/usr/bin/env"
//     process.arguments       = arguments
//     process.standardOutput  = pipe

//     process.launch()

//     let handle  = pipe.fileHandleForReading
//     let data    = handle.readDataToEndOfFile()

//     return String(data: data, encoding: .utf8)
//   }

//   func exec(_ path:String, callback:(() -> ())) {
//     let process         = Process()
//     process.launchPath  = path

//     process.launch()
//     process.waitUntilExit()
//     callback()
//   }
// }


/*
import Foundation
import PathKit

let task = Task()
let path = Path.current + Path("Taskfile")
let data = try! path.read()

guard let taskfile = String(data: data, encoding: .utf8) else {
  print("\nUnable to read Taskfile\n")
  exit(1)
}

let output    = Path.current + Path(".\(UUID().uuidString).swift")
let arguments = ProcessInfo.processInfo.arguments[1..<ProcessInfo.processInfo.arguments.count]
let argCount  = arguments.count
let taskArg   = arguments.first ?? "default"
let taskArgs  = arguments[1..<arguments.count].map { "\"\($0)\""}
let result    = task.generate(from:taskfile, task:taskArg, arguments:taskArgs)

if output.exists {
  do { try output.delete() } catch {}
}

let executingPath = String(describing:output)

do {
  try output.write(result)
  try FileManager.default.setAttributes([FileAttributeKey.posixPermissions: 484], ofItemAtPath: executingPath)
} catch {
  print("Unable to write file")
  exit(1)
}

task.exec(executingPath) {
  do { try output.delete() } catch {}
}

*/
