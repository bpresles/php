#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

php -m > ~/php_modules.tmp
echo -n "Checking PHP modules... "

# Modify copy, keep the mounted version untouched.
cp ~/php_modules ~/expected_modules

if [[ "${PHP_DEBUG}" == 1 ]]; then
    sed -i '/blackfire/d' ~/expected_modules
fi

if ! cmp -s ~/php_modules.tmp ~/expected_modules; then
    echo "Error. PHP modules are not identical."
    diff ~/php_modules.tmp ~/expected_modules
    exit 1
fi

echo "OK"

echo -n "Checking composer... "
composer --version | grep -q 'Composer version'
echo "OK"

echo -n "Checking walter... "
walter -v | grep -q 'Walter version'
echo "OK"
