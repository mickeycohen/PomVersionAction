#!/bin/bash
echo "pom path: ${INPUT_POM_PATH}"

if [ -z "${INPUT_VERSION}" ]
then
  echo "Version not provided, trying to bump current version"
  VERSION=$(xmllint --xpath '/*[local-name()="project"]/*[local-name()="version"]/text()' ${INPUT_POM_PATH})
  echo "Current version in pom.xml: $VERSION"
  NEWVERSION=$(echo $VERSION | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')
else
  echo "custom version provided: ${INPUT_VERSION}"
  NEWVERSION=${INPUT_VERSION}
fi

echo "New version: $NEWVERSION"
echo "Setting new version in pom.xml"
sed -i "0,/<version>/{s/<version>.*/<version>$NEWVERSION<\/version>/}" ${INPUT_POM_PATH}
echo "::set-output name=new_version::$NEWVERSION"
