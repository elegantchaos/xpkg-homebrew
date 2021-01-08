// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// git@github.com:elegantchaos/xpkg-homebrew - An XPkg package.
// Created by Sam Deane, 19/07/2019.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XPkgPackage
import Runner
import Foundation

let arguments = CommandLine.arguments

let package = InstalledPackage(fromCommandLine: arguments)


let links = [
    ["add-path.sh", "~/.local/share/shell-hooks/startup/homebrew-path"],
]

try! package.performAction(fromCommandLine: CommandLine.arguments, links: links)

let scriptURL = package.local.appendingPathComponent("install.sh")
if package.action(fromCommandLine: arguments) == .install {
    // open the install script in a new terminal window - it will prompt the user to install homebrew
    scriptURL.openWithWorkspace()
}
