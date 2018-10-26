##=============================================================================##
## Replication Code for Fang, Guess, and Humphreys
## "Can Government Deter Discrimination? Evidence from a Randomized Intervention in New York City"
## 26 October 2017
##=============================================================================##

##=============================================================================##
## Read-In Data
##=============================================================================##

if(local_data){   ### READ IN DATA FROM LOCAL DIRECTORY
  
  # Data files
  dat <- read.csv("dat_c_xs.csv", header=TRUE)  ## dat == main dataset (case level, experiment sample)
  aud <- read.csv("dat_c_as.csv", header=TRUE)  ## aud == case level, audit sample dataset
  ctx <- read.csv("dat_ct_xs.csv", header=TRUE) ## ctx == case tester level, experiment sample

  # Look-up file for mega-plot containing results
  look <- read.csv("megaplot_lookup.csv", header=TRUE, colClasses="character", strip.white=TRUE)
  
} else {          ### READ IN DATA FROM DATAVERSE (API TOKEN REQUIRED)
  
  # Get dataset from Dataverse
  dataset <- get_dataset("doi:10.7910/DVN/CF44OW")
  (dataset)

  # Save data to local directory from Dataverse
  writeBin(get_file("dat_c_xs.tab", "doi:10.7910/DVN/CF44OW"), "dat_c_xs.csv")
  writeBin(get_file("dat_c_as.tab", "doi:10.7910/DVN/CF44OW"), "dat_c_as.csv")
  writeBin(get_file("dat_ct_xs.tab", "doi:10.7910/DVN/CF44OW"), "dat_ct_xs.csv")
  writeBin(get_file("megaplot_lookup.tab", "doi:10.7910/DVN/CF44OW"), "megaplot_lookup.csv")

    # Load data files
  dat <- read.csv("dat_c_xs.csv", header=TRUE)  ## dat == main dataset (case level, experiment sample)
  aud <- read.csv("dat_c_as.csv", header=TRUE)  ## aud == case level, audit sample dataset
  ctx <- read.csv("dat_ct_xs.csv", header=TRUE) ## ctx == case tester level, experiment sample
  look <- read.csv("megaplot_lookup.csv", header=TRUE, colClasses="character", strip.white=TRUE)
  
}