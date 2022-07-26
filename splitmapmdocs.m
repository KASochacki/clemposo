function splitmapmdocs()
%when MapGrids script from https://serialemscripts.nexperion.net/script/21
%is used to collect maps from multiple grids, 
%are made using a script to map all grids in the cartridge, It
%creates one large file and one large mdoc file. I use this function to
%separate out the mdoc files for each separate grid. This is because I
%would like to use the mdoc file to give me the stage coordinates of my
%montage when I am putting together the LMM information and the MMM
%information. KAS 20220622.
[file1,path1] = uigetfile('*.mdoc', 'Please choose the mdoc file you would like to separate.');
fid  = fopen([path1 file1],'r');
[filepath,rootname,ext] = fileparts([path1 file1]);
f=fread(fid,'*char')';
fclose(fid);
what=regexp(f,'\n','split');
finallineall = (find(contains(what,'FullMontNumFrames')));
montnum=length(finallineall);

headerfinalline = (find(contains(what,'Tilt axis angle')));

for ii=1:montnum
    newfilename=[rootname '_map',num2str(ii),'.mdoc'];
    fid1=fopen([path1 newfilename],'w');
    for jj=1:headerfinalline+1
        fprintf(fid1,'\n%s',what{jj});
    end
    if ii==1
        for jj=headerfinalline+2:finallineall(ii)
            fprintf(fid1,'\n%s',what{jj});
        end
    else
        for jj=finallineall(ii-1)+1:finallineall(ii)
            fprintf(fid1,'\n%s',what{jj});
        end
        
    end
    fclose(fid1);
end


% montagedimstxt=what(whichline);
% spaceloc=strfind(montagedimstxt{1},' ');
% Xdim=str2num(montagedimstxt{1}(spaceloc(2)+1:spaceloc(3)-1));
% Ydim=str2num(montagedimstxt{1}(spaceloc(3)+1:end));
% piecenum=Xdim.*Ydim;
% 
% fid  = fopen('output.txt','w');
% fprintf(fid,'%s',f);
% fclose(fid);