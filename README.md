# Snapshot-Test-Example

Snapshot tests are an easy way to ensure that the UI doesn’t change unexpectedly when you modify your code. It is a powerful method of testing visual components that works by comparing a snapshot of your UI with a previously-stored reference image, if the two images are the same, the test will pass. If the images are different, the test will fail, and you know something has changed your UI.
Why Snapshot Testing?
Snapshot testing is easy to implement (in most cases). It allows you to keep your UI consistent, meaning there are no more surprises when changing the underlying code.

## Requirements

- iOS 13.0+
- Xcode 11
- Swift 5

## Installation

- Download the demo app's source code
- Open the .xcworkspace file
- Build & Run
- Run the tests from the SnapshotTests target
