OpenCL C++ specification
================================================

These instructions describe how to generate OpenCL C++ specification from AsciiDoc files

The OpenCL C++ specification is maintained by members of the The Khronos Group Inc.,
at https://github.com/KhronosGroup/OpenCL-CXX.

Contributions via merge request are welcome. Changes must be provided under the [Apache 2.0](#license).  You'll be prompted with a one-time "click-through" Contributor's License Agreement (CLA) dialog as part of submitting your pull request or other contribution to GitHub.

We intend to maintain a linear history on the GitHub `master` branch.

-----------------------
Requirements
-----------------------

* GNU-compatible make
* asciidoc (http://www.methods.co.nz/asciidoc/)

On some systems/build targets you may also need:
* dblatex
* source-highlight
* docbook

These tools are known to work on several varieties of Linux, MacOS X, and Cygwin running under Microsoft Windows.

Git:
* git lfs must be installed (https://git-lfs.github.com/)

-----------------------------------
Generating PDF and HTML files
-----------------------------------

Clone the OpenCL C++ specification:

```bash
  git clone https://github.com/KhronosGroup/OpenCL-CXX master
```

Generate PDF and HTML files:

```bash
  cd OpenCLCXX
  make
```

-----------------------------------
License
-----------------------------------

<a name="license"></a>
Full license terms are in [LICENSE](LICENSE).
```
Copyright (c) 2015-2017 The Khronos Group Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

OpenCL and the OpenCL logo are trademarks of Apple Inc. used by permission by Khronos.