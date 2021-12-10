# Test Cases for MultiFluidSCM
A repository for running the [model](https://github.com/MultiFluidSCM/model) using pre-defined case studies.

## Overview
MultiFluidSCM is a two-fluid single-column model of the atmosphere, capable of simulating dry and moist processes. The two-fluid model is based on the principle of [conditionally filtering the atmosphere into various fluid components](https://doi.org/10.1175/JAS-D-17-0130.1) in a more consistent and complete framework relative to traditional Mass Flux convection parameterizations. As such, a two-fluid model is expected to perform better than existing methods for the grey zone of convection modelling, which requires a consistent treatment of resolved and sub-grid convection. However, in a single-column form, this two-fluid model is expected to be at-least-as accurate as existing parameterizations.

The codebase is separated into the following repositories:
- [MultiFluidSCM/model](https://github.com/MultiFluidSCM/model), which contains the model source code which can be treated as a black box. New model features and physics should be added here.
- [MultiFluidSCM/plots](https://github.com/MultiFluidSCM/plots), which contains the post-processing plotting tools and diagnostics, where the model outputs may be compared with LES data. New diagnostics should be added here.
- [MultiFluidSCM/test_cases](https://github.com/MultiFluidSCM/test_cases), which contains the settings files for each case study. Changes to model settings should be applied here.

Other miscilaneous repositories (some of which remain private) include:
- [MultiFluidSCM/documentation](https://github.com/MultiFluidSCM/documentation), which documents the multi-fluid equations, the numerical methods, the closures and the tuning processes.
- [MultiFluidSCM/settings_graphics](https://github.com/MultiFluidSCM/settings_graphics), which plots the model coefficients relative to the diagnosed values from LES.
- [MultiFluidSCM/sensitivity_tests](https://github.com/MultiFluidSCM/sensitivity_tests), which plots the model sensitivity to various tunable parameters.

## Installation
- Ensure git is installed on your machine: [Git installation guide.](https://github.com/git-guides/install-git)
- Create a MultiFluidSCM folder
- In the MultiFluidSCM folder, get this and the other required repositories using:
```
git clone "https://github.com/MultiFluidSCM/model/"
git clone "https://github.com/MultiFluidSCM/plots/"
git clone "https://github.com/MultiFluidSCM/test_cases/"
```

## Usage of the model
- Run the [model](https://github.com/MultiFluidSCM/model/) using ```convection.m```
- Rename and copy the SCM data ```SCM_results.mat``` into your personal [test_cases](https://github.com/MultiFluidSCM/test_cases/) folder under ```scm_data```
- In ```get_settings.m```, edit ```settings.scm_data``` to be the filename of your SCM data set
- Adjust your plotting preferences in ```get_settings.m``` (more options to be added in the future)
- Run ```plot_profiles.m```
- If the relevant options are selected, ```.fig``` files will be saved to the ```figures/``` folder in your test case directory and rendered images in the ```images/``` folder.

## Version control using git
NOTE: Version control should currently only be used for the [plots](https://github.com/MultiFluidSCM/test_cases/) and [test_cases](https://github.com/MultiFluidSCM/test_cases/) repositories.

### Download the latest version of the code
Get the latest versions of a repository by navigating to your local repository (e.g. /path/to/MultiFluidSCM/plots/) and using
```
git pull
```

### Upload your code to merge with online version
If you have made changes to the scripts which you would like to merge with the master code, do the following:
- Add all modified files in the current directory using ```git add .```
- Commit the changes with a description of the changes using ```git commit -m "Description of changes to code"```
- Upload and merge the changes using ```git push -u origin main```
