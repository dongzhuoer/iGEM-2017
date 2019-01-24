library(stringr)
library(readr)



files <- dir('fonts', pattern = 'ttf') %>% str_replace('.ttf', '');

for (file in files) {
    base64 <- paste0('fonts/', file, '.ttf') %>% base64enc::base64encode() %>% paste0('data:application/octet-stream;base64,', .);
    read_lines('fonts/template.css') %>% 
        str_replace("'base64'", base64) %>% 
        str_replace('name', read.csv('fonts/font.csv', header = F, row.names = 1, stringsAsFactors = F)[file, 1]) %>% 
        write_lines(paste0('fonts/', file, '.css'));
}
    

