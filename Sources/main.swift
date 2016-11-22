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

