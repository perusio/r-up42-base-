# Dockerfile --- using R in building UP42 processing blocks.

# Copyright (C) UP42 GmbH

# Author: António P. P. Almeida <antonio.almeida@up42.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.


# Use the rocker/r-ver base images.
FROM rocker/r-ver

# Installing needed debian packages.
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y apt-transport-https \
    && echo "deb https://cloud.r-project.org/bin/linux/debian stretch-cran35/" >> /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends libgdal-dev

# Installing R packages.
RUN R -e "install.packages('rgdal')" \
    && R -e "install.packages('raster')" \
    && R -e "install.packages('caret')"

WORKDIR test-script
COPY test.r .

CMD ["R", "-f test.r"]
