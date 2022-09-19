#!/usr/bin/env bash

set -eo pipefail

echo "Generating gogo proto code..."
cd proto
buf build -v # looks like unnecessary
proto_dirs=$(find ./decimal -path -prune -o -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq)
echo "$proto_dirs"
for dir in $proto_dirs; do
  files=$(find "${dir}" -maxdepth 1 -name '*.proto')
  for file in $files; do
    if grep "option go_package" "$file" &> /dev/null ; then
      echo "  $file"
      # buf generate --template buf.gen.gogo.yaml -v "$file"
      buf generate --template buf.gen.ts.yaml -v "$file"
      #buf generate --template buf.gen.dart.yaml -v "$file"
    fi
  done
done
cd ..

echo "Copying result files..."
#cp -vr ./build/proto/go/bitbucket.org/decimalteam/go-smart-node/x/* ./x/
#cp -vr ./build/proto/ts/* ./sdk/proto/ts/
#cp -vr ./build/proto/dart/* ./sdk/proto/dart/
#rm -rf ./build/proto

echo "Success!"
