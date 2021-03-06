// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// git@github.com:elegantchaos/xpkg-homebrew - An XPkg package.
// Created by Sam Deane, 19/07/2019.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XPkgPackage
import Runner
import Foundation
import AppKit

let arguments = CommandLine.arguments

let package = InstalledPackage(fromCommandLine: arguments)


let links = [
    ["add-path.sh", "~/.local/share/shell-hooks/startup/homebrew-path"],
    ["add-path.fish", "~/.config/fish/conf.d/com.elegantchaos.samdeane.homebrew.fish"],
]

try! package.performAction(fromCommandLine: CommandLine.arguments, links: links)

let scriptURL = package.local.appendingPathComponent("install.sh")
if package.action(fromCommandLine: arguments) == .install {
    // open the install script in a new terminal window - it will prompt the user to install homebrew
    let workspace = NSWorkspace.shared
    if let url = workspace.urlForApplication(withBundleIdentifier: "com.apple.terminal") {
        try! workspace.open([scriptURL], withApplicationAt: url, configuration: [:])
    }
}
