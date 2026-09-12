# Building TV-HOME Remote

## Current status

The repository now contains the Objective-C source and an initial GitHub Actions workflow.

## Important compatibility note

iPhone 5 is a 32-bit armv7 device running iOS 10.3.4. Modern GitHub-hosted Xcode images no longer provide a straightforward armv7/iOS 10 SDK build path. The workflow currently validates the source on macOS rather than pretending to produce a working IPA.

Next step: select a reproducible legacy Xcode toolchain or a compatible self-hosted macOS runner, then replace the placeholder project configuration with a complete buildable project.
