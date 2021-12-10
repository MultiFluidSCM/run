# Test Cases for MultiFluidSCM
A repository for running the [model](https://github.com/MultiFluidSCM/model) using pre-defined case studies.

## Overview of MultiFluidSCM
MultiFluidSCM is a two-fluid single-column model of the atmosphere, capable of simulating dry and moist processes. The two-fluid model is based on the principle of [conditionally filtering the atmosphere into various fluid components](https://doi.org/10.1175/JAS-D-17-0130.1) in a more consistent and complete framework relative to traditional Mass Flux convection parameterizations. As such, a two-fluid model is expected to perform better than existing methods for the grey zone of convection modelling, which requires a consistent treatment of resolved and sub-grid convection. However, in a single-column form, this two-fluid model is expected to be at-least-as accurate as existing parameterizations.

The two-fluid model uses a semi-implicit Eulerian discretization. The time discretization is off-centered Crank-Nicolson using an off-centering coefficient of 0.55 and a timestep of $30~$s. The spatial discretization uses a Charney-Phillips grid where pressure, density and horizontal velocities are stored at cell centres, and vertical velocity, entropy and moisture are stored at the cell faces. The system of equations is solved using a quasi-Newton method, where separate linear systems are solved for the first-order moments (with the exception of the horizontal velocity components) and the second-order moments. Splitting the solver up in this way reduces the computational cost whilst retaining the most important couplings and thus allowing the solver to converge.

The codebase is separated into the following repositories:
- [MultiFluidSCM/model](https://github.com/MultiFluidSCM/model), which contains the model source code which can be treated as a black box. New model features and physics should be added here.
- [MultiFluidSCM/plots](https://github.com/MultiFluidSCM/plots), which contains the post-processing plotting tools and diagnostics, where the model outputs may be compared with LES data. New diagnostics should be added here.
- [MultiFluidSCM/test_cases](https://github.com/MultiFluidSCM/test_cases), which contains the settings files for each case study. Changes to model settings should be applied here.

Other miscilaneous repositories (some of which remain private) include:
- [MultiFluidSCM/documentation](https://github.com/MultiFluidSCM/documentation), which documents the multi-fluid equations, the numerical methods, the closures and the tuning processes.
- [MultiFluidSCM/settings_graphics](https://github.com/MultiFluidSCM/settings_graphics), which plots the model coefficients relative to the diagnosed values from LES.
- [MultiFluidSCM/sensitivity_tests](https://github.com/MultiFluidSCM/sensitivity_tests), which plots the model sensitivity to various tunable parameters.

## Installing MultiFluidSCM
- Create a folder named MultiFluidSCM. (Use ```mkdir MultiFluidSCM``` on Unix). The naming of this folder is important as the run-time script will search for this folder name.
- Enter the MultiFluidSCM folder (```cd MultiFluidSCM``` on Unix).
- Download all the essential repositories using:
```
git clone "https://github.com/MultiFluidSCM/model/"
git clone "https://github.com/MultiFluidSCM/plots/"
git clone "https://github.com/MultiFluidSCM/test_cases/"
```

## Using MultiFluidSCM

### Requirements
MultiFluidSCM requires [MATLAB](https://uk.mathworks.com/products/matlab.html). 

**We recommend using MATLAB R2020b as we observed significant memory leaks using the model in MATLAB R2021a**.

### Running the model
- Open MATLAB from inside the [test_cases](https://github.com/MultiFluidSCM/test_cases) repository.
- In the MATLAB console, run the model using ```run_and_plot```. This will run the default case study (ARM) and plot the clouds and vertical profiles once the simulation is complete.
- Run a different case study by specifying the case study name. For example, run the BOMEX case using ```run_and_plot("BOMEX")```.
- Run the model without post-processing plots using ```run``` or ```run("CASE_STUDY_NAME")```.
- If you have previously run the model and wish to re-plot the results, do so using ```plot``` or ```plot("CASE_STUDY_NAME")```. This requires the model output files to be located in [*test_cases/outputs*](https://github.com/MultiFluidSCM/test_cases/outputs).

Model outputs (including data files, plots, figure files and summary statistics) are located in *MultiFluidSCM/test_cases/outputs/CASE_STUDY_NAME/*.

### Adjusting the model settings
Model settings, initital conditions and forcings are located in [*test_cases/settings/settings__default.m*](https://github.com/MultiFluidSCM/test_cases/settings/settings__default.m). After the first run of the model, a copy of the settings file is created named *test_cases/settings/settings__user.m*. Any experimental changes to the model settings should be made to *settings__user.m*, which is not tracked by git. Note that *settings__user.m* is called after *settings__default.m*, thus overriding the default settings.

Initial conditions and forcings for case studies such as ARM and BOMEX are in the files *test_cases/settings/settings_CASE_STUDY_NAME.m*. The case study settings are called last and therefore override *settings__default.m* and *settings__user.m*.

### Adding a new case study

Create a new case study settings file named *test_cases/settings/settings_CASE_STUDY_NAME.m* and specify the initial conditions and forces within (using *settings__default.m* as a reference if necessary).

Run the case study within MATLAB (with the MATLAB path set to *MultiFluidSCM/test_cases*) using ```run_and_plot("CASE_STUDY_NAME")```

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
