---
title: CDFLib library wrapped for Torch
layout: doc
---

#CDFLib Functions Library, wrapped for Torch


##Example


##Installation

From a terminal:

```bash
luarocks install cdflib
```

##Unit Tests

Last but not least, the unit tests are in the folder
[`luasrc/tests`](https://github.com/jucor/torch-cdflib/tree/master/luasrc/tests). You can run them from your local clone of the repostiory with:

```bash
git clone https://www.github.com/jucor/torch-cdflib
find torch-cdflib/luasrc/tests -name "test*lua" -exec torch {} \;
```

Those tests will soone be automatically installed with the package, once I sort out a bit of CMake resistance.

##Direct access to FFI

###cdflib.ffi.*

Functions directly accessible at the top of the `cdflib` table are Lua wrappers to the actual C functions from Cephes, with extra error checking. If, for any reason, you want to get rid of this error checking and of a possible overhead, the FFI-wrapper functions can be called directly via `cdflib.ffi.myfunction()` instead of `cdflib.myfunction()`.
