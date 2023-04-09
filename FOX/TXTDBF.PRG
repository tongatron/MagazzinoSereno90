use tempdbf
append from dati type sdf
sele 2
use maxdbf
zap
sele 1
go top
do while .not. eof()
  sele 2
  append blank
  replace c1 with substr(tempdbf->riga,  1,10)         ,;
          c2 with substr(tempdbf->riga, 12,10)         ,;
          c3 with substr(tempdbf->riga, 23,40)
  replace c4 with substr(tempdbf->riga, 64,40)         ,;
          c5 with substr(tempdbf->riga,105,19)         ,;
          c6 with substr(tempdbf->riga,115,16)         ,;
          c7 with substr(tempdbf->riga,122,25)
  sele 1
  skip
enddo
