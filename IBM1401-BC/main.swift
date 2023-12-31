import Foundation
import Lib1401

func usage() {
    print("usage: \(ProcessInfo.processInfo.processName) [-d -e] filename")
    print("Options:")
    print("\t-d: Decode the given file")
    print("\t-e: Encode the given file")
    exit(1)
}

do {
    if CommandLine.arguments.count < 3 || !["-d", "-e"].contains(CommandLine.arguments[1]) {
        usage()
    }

    let filename = "./"+CommandLine.arguments[2]
    let input = try Data(contentsOf: URL(filePath: filename))

    if CommandLine.arguments[1] == "-e" {
        let encoded = try Lib1401.CharacterEncodings.shared.encode(code: String(data: input, encoding: .utf8)!)
        try Data(encoded).write(to: URL(filePath: filename+".dis"))
    } else {
        if let decoded = try Lib1401.CharacterEncodings.shared.decode(from: Data(input)), let data = decoded.data(using: .utf8) {
            try data.write(to: URL(filePath: filename+".bcd"))
        }
    }
} catch {
    fatalError(error.localizedDescription)
}

