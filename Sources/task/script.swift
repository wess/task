let taskSwift = [
"typealias TaskCallback          = ([String]) -> ()",
"typealias TaskNamespaceCallback = (String) -> ()",
"",
"var namespace:String?                 = nil",
"var tasks:[String:TaskCallback]       = [:]",
"var prerequisites: [String: [String]] = [:]",
"",
"func namespace(_ name:String, callback:@escaping TaskNamespaceCallback) {",
"  namespace = name",
"  callback(name)",
"  namespace = nil",
"}",
"",
"func task(_ name:String, _ prereqs:[String]? = nil, callback:@escaping TaskCallback) {",
"  var key             = name",
"  var current:String  = \"\"",
"",
"  if let namespace = namespace {",
"    current  = namespace ",
"    key      = key + \":\" + current",
"  }",
"",
"  if let prereqs = prereqs {",
"    prerequisites[name] = prereqs",
"",
"    let  withPrereqs:TaskCallback = { args in",
"      var taskName = name",
"",
"      for taskKey in prereqs {",
"        if let namespace = namespace {",
"          taskName = namespace + \":\" + taskKey",
"        }",
"",
"        if let taskItem = tasks[taskName] {",
"          taskItem(args)",
"        }",
"      }",
"",
"      callback(args)",
"    }",
"",
"    tasks[key] = withPrereqs",
"  } else {",
"    tasks[key] = callback",
"  }",
"}",
"",
"func runTask(_ name:String, args:[String]) {",
"  guard let task = tasks[name] else {",
"    return",
"  }",
"",
"  task(args)",
"}",
"",].joined(separator: "\n")

let taskFooter = "\nrunTask(\"{#name}\", args: {#args})"