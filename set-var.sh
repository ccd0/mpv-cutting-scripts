#!/bin/bash
echo "$2" > $(dirname "${BASH_SOURCE[0]}")/val-"$1"

