SL4Swift
===============

Simple Logging Library for Swift


This software is released under the MIT License, see LICENSE


## Usage

```swift
let logger = LoggerFactory.getLogger(.INFO)
logger.info("logger test")      //=> output log
logger.trace("hogehogehohgeu")  //=> do nothing(loglevel = .INFO)
```

## LogLevel

* trace
* debug
* info
* warn
* error
