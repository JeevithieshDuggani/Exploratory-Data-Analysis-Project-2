##  Storing the file names of the compressed and the extracted dataset
zipname    <- "exdata_data_NEI_data.zip"
filename1  <- "summarySCC_PM25.rds"
filename2  <- "Source_Classification_Code.rds"

##  Existance values
zipexists  <- file.exists(zipname)
filesexist <- file.exists(filename1) & file.exists(filename2)

##  Check for the presence of the dataset. If the file and the folder do not exist then download
if (!(zipexists | filesexist)) {
    print("The file is not present in the folder. Downloading now ...")
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileURL, filename)
}
##  If the extracted dataset does not exist then extract
if (!filesexist) {
    print("The file is not extracted. Extracting now ...")
    unzip(zipname)
    ##  Remove zip file
    file.remove(zipname)
}

##  Load the data
if (!exists("NEI")) NEI <- readRDS(filename1)
if (!exists("SCC")) SCC <- readRDS(filename2)

##  end

