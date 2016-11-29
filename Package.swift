import PackageDescription

let package = Package(
    name: "task",

    targets: [
      Target(name: "task", dependencies: ["middleware",]),
      Target(name: "middleware"),
    ],

    dependencies: [
        .Package(url: "https://github.com/kylef/PathKit",     majorVersion: 0, minor: 7),
        .Package(url: "https://github.com/onevcat/Rainbow",   majorVersion: 2),
        .Package(url: "https://github.com/jakeheis/SwiftCLI", majorVersion: 2),
    ]
)

