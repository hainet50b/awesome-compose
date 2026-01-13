#!/usr/bin/env bash
set -eu

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

sudo git clean -fdx "${script_dir}/conf" "${script_dir}/webapps"

