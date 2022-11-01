# CrackStation
![Build Status](https://github.com/subramanya1702/CrackStation/actions/workflows/swift.yml/badge.svg)

version: 1.0.1

## What is CrackStation?

CrackStation is a library that is capable of cracking a hashed password. It can crack passwords upto three characters in length which are the comibinations of "A-Z", "a-z", "0-9", "?" and "!"
- Feed in a hashed password
- Receive the original password text
- ✨Voila ✨

## How to Install?

CrackStation depends on a json lookup file to crack passwords. So, make sure the DictionaryPasswords.json file is present under the /Sources directory. If not, follow the steps below.

Go to /HashGenerator directory and execute the jar file.

```sh
java -jar hashgenerator-1.0.0.jar
```

After executing the jar, you should see the files DictionaryPasswordsSHA1.json and DictionaryPasswordsSHA256.json. Copy these two files and place them under /Sources/CrackStation directory.

Now, add the package CrackStation to your application and import the dependency. CrackStation has a public API `decrypt(shaHash: String)` that takes in a SHA hash and gives back the cracked/actual password.
Here is an example implementation
```
import CrackStation

public func yourFuncThatCracksPassword() -> String {
    let crackStation = CrackStation()
    let crackedPassword = crackStation.decrypt(shaHash: "some_sha_hash")
    
    return crackedPassword
}
```

### Author
Subramanya Keshavamurthy
