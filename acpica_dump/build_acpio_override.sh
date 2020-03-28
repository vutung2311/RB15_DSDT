#!/bin/bash

set -e

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $CUR_DIR

iasl -tc dsdt.dsl 2>&1 | tee compile.log
cp dsdt.aml ./kernel/firmware/acpi/
find kernel | cpio -H newc --create > acpi_override.cpio
sudo cp acpi_override.cpio /boot/efi/