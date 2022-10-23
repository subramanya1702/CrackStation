# CrackStation
### _Crack em up_

## What is CrackStation?

CrackStation is a library that is capable of cracking a hashed password. It can crack passwords upto three characters in length which are the comibinations of "A-Z", "a-z", "0-9", "?" and "!"
- Feed in a hashed password
- Receive the original password text
- ✨Voila ✨

## How to Install?

CrackStation depends on a json lookup file to crack passwords. So, make sure the DictionaryPasswords.json file is present under the /Sources directory. If not, follow the steps below.

Go to /HashGenerator directory and execute the hashgenerator jar file.

```sh
java -jar JAR_NAME.jar
```

After executing the jar, DictionaryPasswords.json should have been created under the Sources directory.

Now, add the package CrackStation to your application and import the dependency. CrackStation has an exposed function `crack(password: String)` that takes in the hashed password and gives back the cracked/actual password.
