#!/bin/bash

function create_assets {
    operation=$1;
    flag=$2;
    shift; shift;
    assets=("$@")

    for asset in "${assets[@]}"
    do
        # if [[ ! "$flag $asset" ]]; then
            $operation $asset
            echo "Created $asset"
        # fi
    done
}

declare -a directories=("./src" "./dist")
create_assets "mkdir" "-d" "${directories[@]}"
declare -a files=("./src/index.ts")
create_assets "touch" "-f" "${files[@]}"

npx tsc \
    --init \
    --target es2016 \
    --rootDir './src' \
    --declaration true \
    --declarationMap true \
    --emitDeclarationOnly true \
    --outDir './dist' \
    --removeComments true \
    --pretty \
