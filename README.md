vimfiles
========

Make piping files into vim easier.

Examples
--------

### Input:

Find all files that start with 'file' and open individually in vim. Once the first file is closed
the next file will be opened.

```
find . -name 'file*' | vimfiles
```

### Commands:

Change all instances of 'foo' to 'bar' globaly `/g` in each file with confirmation `/gc` of each replace, then close the file
automatically after the last match `|x` and move to the next file.
```
find . -name 'file*' | vimfiles -c '%s/foo/bar/gc|x'
```
