3rd party components needed for Fahrplan
========================================

gauss-kruger-cpp
----------------

This library is used for coordinate transformations in backends where the API
is using some Gauss–Krüger projection rather than latitude and longitude. No
separate building is required - only to include one header file and one cpp
file. To avoid extra work for all Fahrplan developers, it is not included as
a Git submodule but only copied from the original repository. Updating
shouldn't be too hard to do: remove the existing folder and clone the
repository. The current home of the project is
https://github.com/f03el/gauss-kruger-cpp.
