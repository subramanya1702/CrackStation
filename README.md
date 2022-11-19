# CrackStation, a Decrypter Implementation

A library that cracks hashed passwords.

![Build Status](https://github.com/subramanya1702/CrackStation/actions/workflows/swift.yml/badge.svg)

version: 1.1.0

## Overview

CrackStation is a library that is capable of cracking unsalted password hashes generated using either SHA-1 or SHA-256 functions. It can crack passwords upto three characters in length, which are the comibinations of "A-Z", "a-z", "0-9", "?" and "!".
- Feed in an unsalted hashed (Supports: SHA1 and SHA256)
- Receive the actual password
- ✨Voila ✨

## Mission Statement

CrackStation aids as an educational/informational tool in understanding the importance of salted hashes. Using of unsalted hashes is very insecure because the passwords can be cracked by generating all possible combinations with their hashes and then performing a reverse look up to find the matching password.


## Installation

### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager.) is "a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling and linking dependencies."

Once you have your Swift package set up, add CrackStation to the list of dependencies in you ```Package.swift``` file:
```
dependencies: [
    .package(url: "git@github.com:subramanya1702/CrackStation.git", .upToNextMajorVersion(from: "1.1.0"))
]
```

## Usage

### The API
CrackStation has two public APIs.

a) An initializer to create an instance of CrackStation
```
init()
```

b) A decrypt function that takes in an unsalted SHA hash and gives back the cracked/actual password
```
decrypt(shaHash: String) -> String?
```

### An Example

```
import CrackStation

public class yourClass: Decrypter {
    private let crackStationObject: Decrypter

    public init() {
        crackStationObject = CrackStation()
    }

    public func yourFunctionThatWantsThePassword() -> String {
        let crackedPassword = crackStationObject.decrypt(shaHash: "some_sha_hash")
        return crackedPassword
    }
}
```

## Author
Subramanya Keshavamurthy
