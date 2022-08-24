# PomVersionAction
This GitHub Action can either set the version on a pom.xml, or get the current version and bumps it (patch)

## Usage

This action has 2 optional parameters:

* pom_path - The path to the pom.xml file. Default is pom.xml (i.e. at the current directory). If provided, must include the file name as well.
* version - The version number to set. If not provided, the current version will be bumped by 1 (patch)

### Bump Version

```
  - name: Bump Version
    uses: mickeycohen/PomVersionAction@0.0.1
```

### Set Version
```
  - name: Set Version
    uses: mickeycohen/PomVersionAction@0.0.1
	with:
	  version: 1.0.0
```

## Output

The new version will be set as the output of this task as new_version

## Limitations

When using the bump option, qualifiers (i.e. SNAPSHOT) are not supported and will be removed from the final version number.