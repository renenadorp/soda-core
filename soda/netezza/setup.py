#!/usr/bin/env python
import sys

from setuptools import find_namespace_packages, setup

if sys.version_info < (3, 7):
    print("Error: Soda Core requires at least Python 3.7")
    print("Error: Please upgrade your Python version to 3.7 or later")
    sys.exit(1)

package_name = "soda-core-netezza"
package_version = "3.0.38"
# TODO Add proper description
description = "Soda Core Netezza Package"

requires = [f"soda-core=={package_version}", "nzpy>=1.15"]
# TODO Fix the params
setup(
    name=package_name,
    version=package_version,
    install_requires=requires,
    packages=find_namespace_packages(include=["soda*"]),
)
