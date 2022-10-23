# What is CrackStation?

###CrackStation is a library that is capable of cracking a hashed password. 

###The library can crack passwords upto three characters in length which are the comibinations of characters "A-Z", "a-z", "0-9", "?" and "!".


#How to run CrackStation?

###CrackStation depends on a json lookup file to crack passwords. So, make sure the **DictionaryPasswords.json** file is present under the **/Sources** directory. If not, follow the steps below.

###Go to the **/HashGenerator** directory and execute the **hashgenerator** jar file.

###`java -jar JAR_NAME.jar`

###After executing the jar file, the DictionaryPasswords.json file should have been created under the Sources directory.

###Add the package CrackStation to the desired application and import the dependency. 
###CrackStation has exposed a function `crack(password: String)` that takes in the hashed password and gives back the cracked/actual password.

