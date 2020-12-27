//
//  File.swift
//  
//
//  Created by Thies C. Arntzen on 27.12.20.
//

import Foundation
import AVFoundation
import Progress

extension AVAssetExportSession.Status : CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown: return "unknown"
        case .waiting: return "waiting"
        case .exporting: return "exporting"
        case .completed: return "completed"
        case .failed: return "failed"
        case .cancelled: return "cancelled"
        @unknown default:
            return "AVAssetExportSession.Status:\(rawValue)"
        }
    }
}

let sourceAsset = AVAsset(url: URL(fileURLWithPath: CommandLine.arguments[1]))
let outputURL = URL(fileURLWithPath: CommandLine.arguments[2])

let exportSession = AVAssetExportSession(
    asset: sourceAsset,
    presetName: AVAssetExportPresetHEVCHighestQuality)!

exportSession.canPerformMultiplePassesOverSourceMediaData = true
exportSession.outputURL = outputURL

switch outputURL.pathExtension.lowercased() {
case "mov": exportSession.outputFileType = AVFileType.mov
case "mp4": exportSession.outputFileType = AVFileType.mp4
case "m4v": exportSession.outputFileType = AVFileType.m4v
default: fatalError("unknown extension")
}

let timer = Timer.init(timeInterval: 1, repeats: true) { (timer) in
    print(Int(exportSession.progress * 100))
}

RunLoop.main.add(timer, forMode: .common)

print("start export")
exportSession.exportAsynchronously {
    print("done: \(exportSession.status)")
    if exportSession.status == .completed {
        exit(0)
    }
    exit(-1)
}

RunLoop.main.run()
