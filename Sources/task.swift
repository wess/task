
import Foundation 

struct Task {
  func generate(from taskfile:String, task:String, arguments:[String] = []) -> String {
    let args        = "[" + arguments.joined(separator: ",") + "]"
    let header      = "#!/usr/bin/env swift\nimport Foundation\n"
    let tasks       = taskfile.replacingOccurrences(of: "import Foundation", with: "").replacingOccurrences(of: "import task", with: taskSwift)
    let footer      = taskFooter.replacingOccurrences(of: "{#name}", with: task).replacingOccurrences(of: "{#args}", with: args)
    let result      = (header + tasks + footer)

    return result
  }

  @discardableResult
  func exec(_ arguments:[String]) -> String? {
    let pipe                = Pipe()
    let process             = Process()
    process.launchPath      = "/usr/bin/env"
    process.arguments       = arguments
    process.standardOutput  = pipe

    process.launch()

    let handle  = pipe.fileHandleForReading
    let data    = handle.readDataToEndOfFile()

    return String(data: data, encoding: .utf8)
  }

  func exec(_ path:String, callback:(() -> ())) {
    let process         = Process()
    process.launchPath  = path

    process.launch()
    process.waitUntilExit()
    callback()
  }
}