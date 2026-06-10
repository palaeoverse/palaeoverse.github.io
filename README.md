This repository contains the code to build palaeoverse.org. This document details how to contribute to this website.

* [Technical requirements](#technical-requirements)
    * [Quarto](#quarto)
    * [R packages](#r-packages)
* [How-to guide](#how-to-guide)
    * [I want to modify the "Events" page](#i-want-to-modify-the-events-page)
    * [I want to modify the "People" page](#i-want-to-modify-the-people-page)
    * [I want to modify the Code of Conduct, AI policy, or Zulip page](#i-want-to-modify-the-code-of-conduct-ai-policy-or-zulip-page)
    * [I want to modify the style of the website](#i-want-to-modify-the-style-of-the-website)
    * [I want to modify another page not listed above](#i-want-to-modify-another-page-not-listed-above)

## Technical requirements

This section details the tools required to build and modify the website locally.

*Note that you can do many changes without building the website locally, see the "How-to guide" below.*

### Quarto 

This website is built with [Quarto](https://quarto.org/) so you need to install it to modify and render the website locally. 

### R packages

We use some R packages in some pages so you will need to install them in order to build the website locally:

```r
install.packages(c(
    "dplyr", "tidyr", "googlesheets4", "rmarkdown", "cranlogs", 
    "openalexR", "mapgl", "gh", "reactable", "brand.yml"
))
```


## How-to guide

### I want to modify the "Events" page

Lecture series are directly pulled from the Google sheets "Palaeoverse > Lecture Series > Lecture Series", so this file needs to be kept up-to-date but there is nothing to be done specifically for the website.

Our events (e.g. workshops) are pulled from the Google sheets "Palaeoverse > Website > Palaeoverse events". This is where you can update information on our events. Once this is done, on this repository:

1. go to the "Actions" tab

[](readme_files/triggering_deployment_1.png)

1. on the left, you should see "Deploy to Github Pages". When you hover it, a "Play" button appears. Click on it to trigger manually.

[](readme_files/triggering_deployment_1.png)

1. wait a few minutes for the website to update


### I want to modify the "People" page

**I want to add or modify information in the "Core team" section**

The information for all team members is stored in the "Team info" Google sheet (on Google drive: Palaeoverse > Website > Team info). You can add new information or modify existing information there. Once this is done, on this repository:

1. go to the "Actions" tab

[](readme_files/triggering_deployment_1.png)

1. on the left, you should see "Deploy to Github Pages". When you hover it, a "Play" button appears. Click on it to trigger manually.

[](readme_files/triggering_deployment_2.png)

1. wait a few minutes for the website to update

**I want to add a new picture**

Pictures of contributors are stored in "_img/profiles" so you can add a new picture there. Two constraints:

1. it **must** be a png file;
1. the filename **must** be the first name of the person as listed in the Google sheet. For instance, if the first name in the Google sheet is "Lewis A.", then the filename must be "Lewis A..png" (note the two dots).

**I want to modify the list of past contributors**

This list can be modified directly in the file "about > people > index.qmd". The website will be updated after you have pushed your change to the repository (the update will take a few minutes).


### I want to modify the Code of Conduct, AI policy, or Zulip page

These three documents are not only used on the website so they live in the [`palaeoverse/resources` repository]() so you should modify them there. The current repository will automatically trigger a website update if it detects that those files have changed in `palaeoverse/resources` (this update will take a few minutes to appear).


### I want to modify the style of the website

The style of the website is controlled by two files:

- `_brand/_brand.yml`: this controls the general branding guidelines, e.g. the list of colours or fonts to be used in all Palaeoverse materials. **Do not modify this file by hand.** This file is a copy from the `brand.yml` that lives in the `palaeoverse/resources` repository. If the file changed there, run `quarto use brand palaeoverse/resources` in the current repository to update it here.

- `styles.scss`: this controls the details of the website. If you want to modify it, it is recommended to build the site locally (cf. next section) so that you can see the actual changes in style before deploying the website.


### I want to modify another page not listed above

If the change is simple enough, e.g. fixing typos or improving wording, you can directly edit the file from the Github interface.

[ADD SCREENSHOTS]