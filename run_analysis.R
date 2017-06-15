library(reshape2)

## Performs the main function of calculating the mean of each variable for each activity and each subject contained
## in the UCI dataset.
run_analysis <- function() {
  
  ## Check if directory exists
  if (!dir.exists("UCI HAR Dataset")) {
    stop("The directory 'UCI HAR Dataset' does not exist.")
  }

  ## The indices for the columns containing the mean or standard deviation of the metrics
  indices <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)
  
  ## One column of features (metrics/variables)
  features <- read.table("UCI HAR Dataset/features.txt")[,2]
  
  ## One column of activity labels
  activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
  
  ## Clean up the features to serve as the column names
  feature_names <- t(data.frame(features))[,indices]
  feature_names <- gsub("-","_",gsub("[()]","",tolower(feature_names)))
  
  ## compiles the data for a given dataset
  compile_data <- function(set) {
    ## read the data into variables
    subjects    <- read.table(paste0("UCI HAR Dataset/", set, "/subject_", set,".txt"))
    x           <- read.table(paste0("UCI HAR Dataset/", set, "/X_", set, ".txt"))[,indices]
    y           <- read.table(paste0("UCI HAR Dataset/", set, "/y_", set, ".txt"))
    
    ## Use activity labels instead of IDs
    activities  <- data.frame(sapply(y, function(v) { activityLabels[v] }))
    
    ## Create a column dedicated to the set name
    set         <- rep(toupper(set), nrow(x))
    
    ## Provide column names
    names(x)          <- feature_names
    names(subjects)   <- c("subject")
    names(activities) <- c("activity")
    names(set)        <- c("set")

    ## Concatenate the columns
    data <- cbind(subjects, cbind(set, cbind(activities, x)))
    
    ## Melt the dataset on subject, activity, and set
    melted <- melt(data, id = c("subject","activity","set"), measure.vars = feature_names)
    
    melted
  }

  test <- compile_data("test")
  train <- compile_data("train")
  
  ## Merge the two datasets
  merged <- merge(test, train, all = T)
  
  ## Cast the dataset from a tall skinny one to a short fat one, with each variable in its own column
  casted <- dcast(merged, subject + activity + set ~ variable, mean)
  
  casted
}
