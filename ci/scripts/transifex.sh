#!/bin/sh

# LICENSE
#
# transifex.sh is part of FlyveMDMAdminDashboard
#
# FlyveMDMAdminDashboard is a subproject of Flyve MDM. Flyve MDM is a mobile
# device management software.
#
# FlyveMDMAdminDashboard is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# FlyveMDMAdminDashboard is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# ------------------------------------------------------------------------------
# @author    Hector Rondon <hrondon@teclib.com>
# @copyright Copyright © Teclib. All rights reserved.
# @license   LGPLv3 https://www.gnu.org/licenses/lgpl-3.0.html
# @link      https://github.com/flyve-mdm/ios-mdm-dashboard.git
# @link      http://flyve.org/ios-mdm-dashboard
# @link      https://flyve-mdm.com
# ------------------------------------------------------------------------------

echo ------------------- Configure Transifex --------------------
# Configure Transifex on develop branch
# Create config file transifex
sudo echo $'[https://www.transifex.com]\nhostname = https://www.transifex.com\nusername = '"$TRANSIFEX_USER"$'\npassword = '"$TRANSIFEX_API_TOKEN"$'\ntoken = '"$TRANSIFEX_API_TOKEN"$'\n' > ~/.transifexrc
# get transifex status
tx status
# push local files to transifex
tx push --source --no-interactive
# pull all the new language
tx pull --all --force
# if there are changes in lenguages
if [[ -z $(git status -uno -s) ]]; then
    echo "tree is clean"
else
    git add -u
    git commit -m "ci(localization): download languages from Transifex"
fi
