function saveMinutia(name,MinutiaFin,MinutiaSep,MinutiaMid)
name=strrep(name,' ','_');
date=datestr(now,29);
FileName=[name '_' date '.txt'];

file=fopen(FileName,'wt');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n',['Name: ' name]);
%fprintf(file,'%s \n',['Date: ' date]);
fprintf(file,'%s','Number of Terminations: ');
fprintf(file,'%2.0f \n',size(MinutiaFin,1));
fprintf(file,'%s','Number of Bifurcations: ');
fprintf(file,'%2.0f \n',size(MinutiaSep,1));
fprintf(file,'%s','Number of Middle Points: ');
fprintf(file,'%2.0f \n',size(MinutiaMid,1));
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','Terminations :');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','X          Y   ');
fprintf(file,'%3.0f \t %3.0f \n',MinutiaFin');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','Bifurcations :');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','X          Y  ');
fprintf(file,'%3.0f \t %3.0f \t \n',MinutiaSep');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','Middle points :');
fprintf(file,'%s \n','-------------------------------------------------------------------');
fprintf(file,'%s \n','X          Y');
fprintf(file,'%3.0f \t %3.0f \n',MinutiaMid');
fclose(file);


