# BORM model

## load GitFileTree

```
Gofer new
	url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
	configurationOf: 'GitFileTree';
	loadDevelopment.
```

## load repo

### READ/WRITE

clone git repo

```
git clone git@github.com:dynacase/borm-model.git my_path_to_wherever
```

load project (in Playground); **Do not forget to point to /repository subfolder.**

```
Metacello new
	baseline: 'BormModel';
	repository: 'gitfiletree:///my_path_to_wherever/repository';
	load.
```

### READ-only

```
Metacello new
	baseline: 'BormModel';
	repository: 'github://dynacase/borm-model/repository';
	load.
```
