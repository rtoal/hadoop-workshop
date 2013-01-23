Films = LOAD 'films-basic' AS
    (id,titles,status,type,origins,rating,pids);
Grouped = GROUP Films BY rating PARALLEL 8;
Summed = FOREACH Grouped GENERATE 
    group, COUNT(Films) AS counts;
STORE Summed INTO 'film-rating-counts'
