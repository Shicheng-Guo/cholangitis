wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/NakamuraM_23000144_GCST001685/hum0076_1stgwas_160916.csv
wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/CordellHJ_26394269_GCST003129/cordell_2015_26394269_pbc_efo1001486_1_gwas.sumstats.tsv.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/JiSG_27992413_GCST004030/ipscsg2016.result.combined.full.with_header.txt
wget https://raw.githubusercontent.com/Shicheng-Guo/m6Asnp/master/m6Asnp.txt


m6A<-read.table("https://raw.githubusercontent.com/Shicheng-Guo/m6Asnp/master/m6Asnp.txt")
d1<-read.csv("hum0076_1stgwas_160916.csv")
d2<-read.table("cordell_2015_26394269_pbc_efo1001486_1_gwas.sumstats.tsv",sep="\t",head=T)
d3<-read.table("ipscsg2016.result.combined.full.with_header.txt")

cminput1<-d1[na.omit(match(as.character(m6A[,1]),as.character(d1[,4]))),c(4,2,3,8)]
colnames(cminput1)=c("SNP","Chromosome","Position","trait1")
CMplot(cminput1,plot.type="b",memo="hum0076_1stgwas_160916",LOG10=TRUE,threshold=NULL,file="jpg",dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)
write.table(cminput1,file=paste("hum0076_1stgwas_160916.pval.manhattan.qqplot.txt",sep=""),sep="\t",quote=F,row.name=T,col.names=NA)

cminput2<-d2[na.omit(match(as.character(m6A[,1]),as.character(d2[,3]))),c(3,1,2,6)]
colnames(cminput2)=c("SNP","Chromosome","Position","trait1")
CMplot(cminput2,plot.type="b",memo="cordell_2015_26394269_pbc_efo1001486_1_gwas",LOG10=TRUE,threshold=NULL,file="jpg",dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)
write.table(cminput2,file=paste("cordell_2015_26394269_pbc_efo1001486_1_gwas.pval.manhattan.qqplot.txt",sep=""),sep="\t",quote=F,row.name=T,col.names=NA)

cminput3<-d3[na.omit(match(as.character(m6A[,1]),as.character(d3[,2]))),c(2,1,3,12)]
colnames(cminput3)=c("SNP","Chromosome","Position","trait1")
CMplot(cminput3,plot.type="b",memo="ipscsg2016",LOG10=TRUE,threshold=NULL,file="jpg",dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)
write.table(cminput3,file=paste("ipscsg2016.pval.manhattan.qqplot.txt",sep=""),sep="\t",quote=F,row.name=T,col.names=NA)


