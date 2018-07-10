# BORM model
[![Build Status](https://travis-ci.org/OpenPonk/borm-model.svg?branch=master)](https://travis-ci.org/OpenPonk/borm-model) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/borm-model/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/borm-model?branch=master)

Smalltalk meta-model for BORM http://ccmi.fit.cvut.cz/methodologies/borm/

Part of [OpenPonk platform](https://openponk.org/).

![meta-model](docs/borm-meta-model.png)

For editor see [borm-editor](https://github.com/openponk/borm-editor)

## Installation

```smalltalk
Metacello new
	baseline: 'BormModel';
	repository: 'github://openponk/borm-model/repository';
	load
```
