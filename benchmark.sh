#!/bin/bash

cd webdriver-ts
echo "clean results"
rm -rf ./results

echo "running tests"
START=$(date +%s);
npm run selenium -- $@
END=$(date +%s);
echo "runnung tests took"
$((END-START)) | awk '{print "int($1/60)":"int($1%60)}'

echo "building report"
npm run results

