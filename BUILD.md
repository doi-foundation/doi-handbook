# doi-handbook creation



Update: 2026-03-17 Instructions for building the PDF from the XML.

Moved to XML source for the Handbook based on the NISO STS schema.



Ensure that java and maven are installed. java -version and mvn - version will both print version numbers of present.



Also need to install the font from ... put in /Library/Fonts on a mac and Windows/Fonts on a PC. On a mac you can also manage fonts through the built-in Font Book app, which handles installation and organization automatically. On a PC double click on a font to install it.



Jave 11 or later required. Maven 3.6 or later required. Open command prompt at the root of the repository package



## Installation

Run 
```
mvn package
```


this will create the necessary software packages ion the target directory


## Operation


### On MacOS

Step 1. To create the intermediary file handbook.fo in the result directory, open terminal and run:

```
sh transform.sh
```

Step 2. To create the PDF handbook.pdf in the result directory, in terminal run 


```
sh generate.sh
```


### On Windows

Step 1. To create the intermediary file handbook.fo in the result directory, open command prompt and run

```
transform
```

Step 2. To create the PDF handbook.pdf in the result directory, in command prompt run 
```
generate
```


