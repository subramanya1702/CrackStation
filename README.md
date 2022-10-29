# CrackStation
### _Crack em up_
### Author: Subramanya Keshavamurthy

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

Now, add the package CrackStation to your application and import the dependency. CrackStation has an exposed function `decrypt(shaHash: String)` that takes in sha hash and gives back the cracked/actual password.
