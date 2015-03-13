##download the data from file's website
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
filePath <- "./data/exdata-data-NEI_data.zip"

if (!file.exists("data")) {
        dir.create("data")
}

if (!file.exists(filePath)) {
        download.file(fileUrl, destfile = filePath)
        date()
        unzip(filePath, exdir="./data")
}
