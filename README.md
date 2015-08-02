SL4Swift
===============

Simple Logging Library for Swift


This software is released under the MIT License, see LICENSE


## Usage

```swift
let logger = LoggerFactory.getLogger(.INFO)
logger.info("logger test")      //=> output log
logger.trace("hoge")  //=> do nothing(loglevel = .INFO)
```

## Log Output Example

```
2015-08-02 16:59:31.482 xctest[74860:477566] [INFO] LoggerTest.swift(testExample():8) - logger test
2015-08-02 16:59:31.482 xctest[74860:477566] [TRACE] LoggerTest.swift(testExample():9) - hoge
```

## LogLevel

* trace
* debug
* info
* warn
* error
