# (C) COPYRIGHT 2018 The Panfrost Community
#
# Authors:
#   Lyude Paul <thatslyude@gmail.com>
#
# This program is free software and is provided to you under the terms of the
# GNU General Public License version 2 as published by the Free Software
# Foundation, and any use by you of this program is subject to the terms
# of such GNU licence.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, you can access it online at
# http://www.gnu.org/licenses/gpl-2.0.html.
#
# SPDX-License-Identifier: GPL-2.0
#
# A simple makefile to make mali_kbase compile against a kernel with a lot less
# fuss. Defines some sane defaults, generates a config header and make config
# options, then compiles things.
#
export

CONFIG_NAME ?= config
CONFIG_FILE = $(CURDIR)/$(CONFIG_NAME)
PANFROST_INC_DIR = $(CURDIR)/panfrost-include
PANFROST_CFG_DIR = $(CURDIR)/panfrost-autogen
MALI_KBASE_SRC_DIR = $(CURDIR)/driver/product/kernel/drivers/gpu/arm/midgard

all: $(PANFROST_CFG_DIR)/config.mk $(PANFROST_CFG_DIR)/config.h
	$(MAKE) -C $(MALI_KBASE_SRC_DIR) all

clean:
	$(MAKE) -C $(MALI_KBASE_SRC_DIR) clean
	rm -rvf $(PANFROST_CFG_DIR)

$(PANFROST_CFG_DIR):
	mkdir -p $@

$(PANFROST_CFG_DIR)/config.h: $(CONFIG_FILE) $(PANFROST_CFG_DIR)
	sed -e 's/^\(MALI_[^=]\+\)=\(.*\)/#define CONFIG_\1 "\2"/g' $< > $@

$(PANFROST_CFG_DIR)/config.mk: $(CONFIG_FILE) $(PANFROST_CFG_DIR)
	sed -e 's/^\(MALI_[^=]\+\)=\(.*\)/export CONFIG_\1 = \2/g' $< > $@
