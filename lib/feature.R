################################################################################
### Construct visual features for training/testing images ###
### Authors: Group 10 ###
### ADS Spring 2018 Project 3 ###
################################################################################

################################################################################
### BEGIN LOAD LIBRARIES ###

source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library("OpenImageR")

### END LOAD LIBRARIES ###
################################################################################

################################################################################
### BEGIN SIFT ###

feature_SIFT <- function(img_dir, 
                         width = 20, height = 20,
                         export=T){
  ### Construct process features for training/testing images
  ### Sample simple feature: Extract row average raw pixel values as features
  
  ### Input: a directory that contains images ready for processing
  ### Output: an .RData file contains processed features for the images
  
  n_files <- length(list.files(img_dir))
  img0 <-  readImage(paste0(img_dir, list.files(img_dir)[1], sep = ""))
  img0 <- EBImage::resize(img0, width, height)
  
  ### store vectorized pixel values of images
  sift <- matrix(NA, n_files, nrow(as.matrix(img0))) 
  for(i in 1:n_files){
    img <- readImage(paste0(img_dir, list.files(img_dir)[i], sep = ""))
    img <- EBImage::resize(img, width, height)
    sift[i,] <- rowMeans(img)
  }

  ### output constructed features
  if(export){
    save(sift, file=paste0("../output/feature_SIFT.RData"))
  }
  return(sift)
}

### END SIFT ###
################################################################################

################################################################################
### BEGIN HOG ###

feature_HOG <- function(img_dir, n_hogs = 54, 
                        width = 20, height = 20,
                        export=T){
  ### Construct process features for training/testing images
  
  ### Input: a directory that contains images ready for processing
  ### Output: an .RData file contains processed features for the images
  
  n_files <- length(list.files(img_dir))
  hog <- matrix(NA, n_files, n_hogs)
  for (i in 1:n_files){
    img <- readImage(paste0(img_dir, list.files(img_dir)[i], sep = ""))
    img <- EBImage::resize(img, width, height)
    hog[i,] <- HOG(img)
  }
  
  ### output constructed features
  if(export){
    save(hog, file=paste0("../output/feature_HOG.RData"))
  }
  return(hog)
}

### END HOG ###
################################################################################

dir <- "../data/images/"
feature_SIFT(dir)
feature_HOG(dir)