# Copyright (c) 2013-2017 The Khronos Group Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

QUIET ?=
ASCIIDOC ?= asciidoc
XMLLINT ?= xmllint
DBLATEX ?= dblatex
DOS2UNIX ?= dos2unix
RM ?= rm -f
VERBOSE ?=

AD_HTML_OPTIONS = -b html5 -a toc2 -a toclevels=3 -a mathjax -f config/mathjax-asciidoc.conf
AD_DB_OPTIONS = -b docbook

all: cxx

clean:
	$(QUIET)$(RM) opencl_cxx.html opencl_cxx.xml opencl_cxx.pdf


OPENCL_CXX_ASC_DEPS=opencl_cxx.asc $(shell grep ^include:: opencl_cxx.asc | sed -e 's/^include:://' -e 's/\[\]/ /' | xargs echo)
DB_CXX_OPTIONS = -P doc.layout="coverpage toc mainmatter" -P doc.publisher.show=0 -P latex.output.revhistory=0 -p dblatex/asciidoc-dblatex.xsl -s dblatex/asciidoc-dblatex.sty

cxx: opencl_cxx.html opencl_cxx.pdf

opencl_cxx.html: $(OPENCL_CXX_ASC_DEPS)
	$(QUIET)$(ASCIIDOC) $(AD_HTML_OPTIONS) $(VERBOSE) -o $@ $<
	$(QUIET)$(DOS2UNIX) $@ 2> /dev/null

opencl_cxx.xml: $(OPENCL_CXX_ASC_DEPS)
	$(QUIET)$(ASCIIDOC) $(AD_DB_OPTIONS) $(VERBOSE) -o $@ $<
	$(QUIET)$(XMLLINT) --nonet --noout --valid $@

opencl_cxx.pdf: opencl_cxx.xml
	$(QUIET)$(DBLATEX) -t pdf $(DB_CXX_OPTIONS) $(VERBOSE) -o $@ $<
	$(QUIET)$(DOS2UNIX) $@ 2> /dev/null
