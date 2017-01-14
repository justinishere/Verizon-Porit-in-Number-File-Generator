

# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(plyr)
library(data.table)
library(shiny)



shinyServer(function(input, output) {
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
    # columns. The 'datapath' column will contain the local filenames where the 
    # data can be found.
  output$contents <- renderTable({
    
    infile <- input$file1
    
    if (is.null(infile))
      return(NULL)
    source<-read.csv(infile$datapath, header=input$header, sep=',',colClasses = "character")
    rename(source,  c("V1"="tf","V2"="effective"))
    
 })
  
  
  datasetInput <- reactive({
    infile <- input$file1
    source<-read.csv(infile$datapath, header=input$header, sep=',',colClasses = "character")
    rename(source,  c("V1"="tf","V2"="effective"))
    
    vz_input<-"~/Dropbox/Verizon_TF_Portin/input"
    vz<-list.files(file.path(vz_input), pattern = ".800*", full.names = T)
    vz<- lapply(vz, fread, sep = ",") 
    vz<-rbindlist(vz)
    setnames(vz, names(vz), c("raw"))
    
    
    string1<-replicate(nrow(source),substring(vz$raw,1,9)[1])
    string2<-replicate(nrow(source),substring(vz$raw,20,29)[1])
    string3<-replicate(nrow(source),substring(vz$raw,42,338)[1])
    
    ##-------------------
    tf<-source$V1
    effective<-source$V2
    output<-noquote(paste0(string1,tf,string2,effective,string3))
  })

  
  
  output$downloadData <- downloadHandler(
    filename = function() { paste(input$file1, '_output.800', sep='') },
     content = function(file) {
      write.table(datasetInput(), quote = F,row.names = FALSE, col.names=F,file)
    }
  )
  
  
})
  

