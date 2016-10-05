# Cleaning and Getting Data Project Code book



## Original Data

There original data comes from the smartphone accelerometer and gyroscope 3-axial raw signals,which have been processed using various signal processing techniques to measurement vector consisting of 561 features.

## Data sets

### Raw data set

The raw dataset was created using the following regular expression to filter out required features, eg. the measurements on the mean and standard deviation for each measurement from the original feature vector set 

`-(mean|std)\\(`

This regular expression selects 66 features from the original data set.
Combined with subject identifiers `subject` and activity labels `label`, this makes up the 68 variables of the processed raw data set.

The training and test subsets of the original dataset were combined to produce final raw dataset.

### Tidy data set

Tidy data set contains the average of all feature standard deviation and mean values of the raw dataset. 
Original variable names were modified in the follonwing way:

 1. Replaced `-mean` with `Mean`
 2. Replaced `-std` with `Std`
 3. Removed parenthesis `-()`
 4. Replaced `BodyBody` with `Body`

#### Measurment Sample
- TimeBodyAccelerometerMeanX 
- TimeBodyAccelerometerMeanY
- TimeBodyAccelerometerMeanZ 
- TimeBodyAccelerometerStdX 
- TimeBodyAccelerometerStdY 
- TimeBodyAccelerometerStdZ 

