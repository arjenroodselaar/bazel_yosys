# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Rules for Yosys.
"""

load("//toolchain/yosys:defs/smtbmc.bzl", "smtbmc_test")
load("//toolchain/yosys:defs/aiger.bzl", "aiger_test")
load("//toolchain/yosys:defs/abc.bzl", "abc_test")


def abc_bmc(**attrs):
    abc_test(mode = "bmc", **attrs)

def abc_prove(**attrs):
    abc_test(mode = "prove", **attrs)

def aiger_prove(**attrs):
    aiger_test(mode = "prove", **attrs)

def aiger_live(**attrs):
    aiger_test(mode = "live", **attrs)

def smtbmc_bmc(**attrs):
    smtbmc_test(mode = "bmc", **attrs)

def smtbmc_prove(**attrs):
    smtbmc_test(mode = "prove", **attrs)

def smtbmc_cover(**attrs):
    smtbmc_test(mode = "cover", **attrs)
