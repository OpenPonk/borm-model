# BORM model
[![Build Status](https://travis-ci.org/OpenPonk/borm-model.svg?branch=master)](https://travis-ci.org/OpenPonk/class-editor) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/class-editor/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/class-editor?branch=master)



Smalltalk meta-model for BORM http://ccmi.fit.cvut.cz/methodologies/borm/

![meta-model](docs/borm-meta-model.png)

For editor see [borm-editor](https://github.com/dynacase/borm-editor)

## Installation

```
Metacello new
	baseline: 'BormModel';
	repository: 'github://dynacase/borm-editor/repository';
	load.
```
