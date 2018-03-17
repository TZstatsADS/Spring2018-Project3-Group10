################################################################################
### Construct visual features for training/testing images  ###
################################################################################

### Authors: Group 10 
### ADS Spring 2018 Project 3

### load libraries
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library("OpenImageR")

################################################################################
### BEGIN SIFT ###
################################################################################
feature <- function(img_dir, 
                    n_pixel_row = 20, n_pixel_col = 20,
                    export=T){
  ### Construct process features for training/testing images
  ### Sample simple feature: Extract row average raw pixel values as features
  
  ### Input: a directory that contains images ready for processing
  ### Output: an .RData file contains processed features for the images
  
  n_files <- length(list.files(img_dir))
  img0 <-  readImage(paste0(img_dir, list.files(img_dir)[1], sep = ""))
  img0 <- EBImage::resize(img0, n_pixel_row, n_pixel_col)
  
  ### store vectorized pixel values of images
  dat <- matrix(NA, n_files, nrow(as.matrix(img0))) 
  for(i in 1:n_files){
    img <- readImage(paste0(img_dir, list.files(img_dir)[i], sep = ""))
    dat[i,] <- rowMeans(img)
  }

  ### output constructed features
  if(export){
    save(dat, file=paste0("../output/feature_SIFT.RData"))
  }
  return(dat)
}
################################################################################
### END SIFT ###
################################################################################

################################################################################
### BEGIN HOG ###
################################################################################

feature_HOG <- function(img_dir, n_hogs = 54, 
                        width = 20, height = 20,
                        export=T){
  
  n_files <- length(list.files(img_dir))
  H <- matrix(NA, n_files, n_hogs)
  for (i in 1:n_files){
    img <- readImage(paste0(img_dir, list.files(img_dir)[i], sep = ""))
    img <- EBImage::resize(img, width, height)
    H[i,] <- HOG(img)
  }
  
  ### output constructed features
  if(export){
    save(H, file=paste0("../output/feature_HOG.RData"))
  }
  return(H)
}

################################################################################
### END HOG ###
################################################################################

dir <- "../data/images/"
feature_HOG(dir)