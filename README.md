# Play By Ear Test (PBET)

The `PBET` is a test of playing by ear ability which can be launched in R/Shiny via the [`psychTestR`](https://github.com/pmcharrison/psychTestR) package.

## Author

Seb Silas, [sebsilas@gmail.com](mailto:sebsilas@gmail.com)

## Demos

Short `PBET` with feedback: https://musicassessr.com/PBET-demo

<!-- Prototype adaptive-`PBET`(*aPBET*) with feedback: https://adaptiveeartraining.com/aPBET -->

## Installation

1. Install *nodeJS*: https://nodejs.org/en/download/

2. Install *R*: https://cloud.r-project.org/

3. Install *RStudio*: https://posit.co/downloads/

4. Launch *RStudio*

5. Install the `devtools` *R* package by pasting the following command into the *RStudio* terminal:

`install.packages('devtools')`

6. Install the `PBET` package:

`devtools::install_github('sebsilas/PBET')`


## Usage

Once you have completed the above steps, you can run the `PBET` test by doing the following:

1. Create a folder which will contain your app. The name of this folder will become the `app_name` argument when you run the `PBET` or `PBET_standalone` functions later.

2. In the folder, create an *R* file called `app.R`. In this file, paste your code to run the `PBET` there, like below:


``` r

# Load the PBET package

library(PBET)

# Run a short test with feedback:

PBET_standalone(app_name = 'my_PBET_app',
               skip_setup = TRUE,
               absolute_url = "https://adaptiveeartraining.com",
               num_items = list("interval_perception" = 0L,
                                 "find_this_note" = 0L,
                                 "arrhythmic" = list("key_easy" = 1L,
                                                     "key_hard" = 1L),
                                 "rhythmic" = list("key_easy" = 1L,
                                                   "key_hard" = 1L),
                                 "wjd_audio" = list("key_easy" = 0L,
                                                    "key_hard" = 0L)),
               examples = list(
                 "find_this_note" = 0L,
                 "interval_perception" = 0L,
                 "arrhythmic" = list("easy" = 0L, "hard" = 0L),
                 "rhythmic" = list("easy" = 0L, "hard" = 0L), # because it's effectively the same task as arrhythmic
                 "wjd_audio" = list("easy" = 0L, "hard" = 0L)
               ),
               feedback = TRUE)

```

Remember that the `app_name` argument should match the name of your folder.

3. Make sure that your current directory is the app folder you created. You can check the current directory by using `getwd()`. You may need to set the app directory by placing `setwd('/Users/musicassessr/my_project/my_PBET_app')` at the beginning of your app file. 

4. Run the app. To do this in *RStudio*, use the shortcut `Command + Shift + Enter` on Mac (`Ctrl + Shift + Enter` on Windows).


5. If the above steps were successful, the `PBET` test should load in your web browser, and as you progress through the test, you should receive feedback after each trial. Recorded audio should appear in the */app_name/www/audio/* directory.

If not, go to our [Troubleshooting]() page or [raise an issue on Github](https://github.com/sebsilas/PBET/issues).

## Usage notes

- This has not yet been tested on Windows. We will be doing this very soon.

- The test requires internet connectivity. 

- The *PBET* runs in your web browser. It is only recommended to run the test in [Google Chrome](https://www.google.com/chrome/) or [Opera](https://www.opera.com/download). You will need to set one of these to be your default browser for *RStudio* to launch the test there (restart *RStudio* after doing this).



## Citation

We advise mentioning the software versions you used,
in particular the versions of the `PBET`, `musicassessr`, `psychTestR`, and `psychTestRCAT` packages.
You can find these version numbers from R by running the following commands:

```r
library(PBET)
library(psychTestR)
library(psychTestRCAT)
if (!require(devtools)) install.packages("devtools")
x <- devtools::session_info()
x$packages[x$packages$package %in% c("PBET", "psychTestR", "psychTestRCAT"), ]
```

## References
 
 
Silas, S., Müllensiefen, D., & Kopiez, R. (2023). Play By Ear Test: Development and validation of an open-source playing by ear test. In prep.

