
# Verizon Toll-free Number Port-in Filer Generator
### This is a R-Shiny application created to accelerate batch toll-free number port-in process to Verizon for Network Operation team of ThinQ,Inc. The download file can be directly uploaded to Verizon website for port-in.


###This is a line from Rstudio

```markdown


### Steps to use

1. Upload Verizon Default.800 file - the Verizon default file format

2. Upload input CSV file  - make sure you see both 'toll-free' and 'effective' column separately displayed on the screen. Otherwise, select a different separator instead of comma

3. Click 'Download', and viola. A .800 file is generated to upload. 


### To run the R Shiny app through R, run the following commands in R:

library(shiny)
runGitHub( "Verizon-Porit-in-Number-File-Generator", "wwzjustin") 




```

![Image](https://github.com/wwzjustin/Verizon-Port-in-Number-File-Generator/blob/master/image.png)
