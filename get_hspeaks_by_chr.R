Args=commandArgs()
dir_code=Args[6]
source(paste0(dir_code,"/write.table0.R"))
source("~/project1/code/call_peak_by_threshold.R")

threshold = Args[7]
dir_p_wig=Args[8]
dir_output=Args[9]
chr=Args[10]


cat("calling high score peaks\n")
cat("p wig files are from this dir:",dir_p_wig,"\n")
  
  cat(chr,"...... ") 
  inputfile=paste0(dir_p_wig,"/",chr,"_p")
  outputfile=paste0(dir_output,"/hspeaks",threshold,chr,".bed")
  
  p=read.table(inputfile)
  
  hspeaks=call_peak_by_threshold(wig = p,threshold,chr)
  write.table0(x=hspeaks,outputfile)
cat(" Finished!\n")
