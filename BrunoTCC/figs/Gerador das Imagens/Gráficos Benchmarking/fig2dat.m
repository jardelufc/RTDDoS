function fig2dat(filename)
% [filename1 pathname1]=uigetfile('*.fig','Select a figure file to extract x-y data');
% if isequal(filename1,0) | isequal(pathname1,0); return; end %User pressed Cancel
%
% [filename2, pathname2] = uiputfile('*.txt', 'Provide an Text file name to save the x-y data');
% if isequal(filename2,0) | isequal(pathname2,0)
%     return
% end %User pressed Cancel
%
% if isempty(strfind(filename2,'.txt'));
%     filename2=[filename2 '.txt'];
% end


% Put the file name here!!! An update would be using a for command and especify all files here and not one per time
% filename='std_3GPP25814_minMos_PRABELC_Fei_Sacchi_PRABEOpt';

filename1=strcat(filename,'.fig');
filename2=strcat(filename,'.dat');

pathname1='.';
pathname2='.';

s=hgload(fullfile(pathname1,filename1)); % open figure and get handle to figure
%delete(legend); %legends add extra data to output. Remove legends

%get line handles
h = findobj(s,'Type','line'); %line is the type of your figure file.
if isempty(h)
    line{1}='Your figure file does not contain x-y data.';
    line{2}='Did you accidentally load a wrong file?';
    line{3}='Your can view your figures using the File menu.';
    line{4}='Make sure you do not load a wrong file.';
    uiwait(msgbox(line, 'No x-y data in your file','warn'));
    close(s)
    return
end

x=get(h,'xdata');
y=get(h,'ydata');


close(s) %close figure with legends removed
s=hgload(fullfile(pathname1,filename1)); %show original figure with legends

h2 = get(s,'children');
hLeg = [];
for k = 1:length(h2)
    if strcmpi(get(h2(k),'Tag'),'legend')
        hLeg = h2(k);
        break;
    end
end

[n dummy]=size(x); %n= number of x-y sets in the figure.

fid=fopen(fullfile(pathname2,filename2), 'wt');
%fprintf(fid,'%s %s\n', 'x, y data extracted from ', [pathname1, filename1]);
%fprintf(fid,'(A figure legend may generate extra x-y data sets with only one or two rows.)\n');
if n==1 %because x{i} becomes invalid symbol below if n=1
    fprintf(fid,'%s\t %s\n', ' x1', ' y1');
    fprintf(fid,'%g\t %g\n', [x;y]);
elseif n > 1
    
    %x{1}=x1 series, y{1} is y1 series, etc.
    %find out maximum x{i} length
    maxsize=length(x{1});
    for i=2:n
        if length(x{i}) > maxsize
            maxsize=length(x{i});
        end
    end
    
    %find out whether all the x series are the same
    xseriessame=1;
    for i=2:n
        if isequal(x{1},x{i})==0 %0 means not equal
            xseriessame=0;
        end
    end
    
    if xseriessame==1; %write x y1 y2... header
        %fprintf(fid,'All the x series in the figure are found to be the same.\n');
        fprintf(fid,' x\t');
        for i=1:n
            fprintf(fid,[char(hLeg.String(n+1-i)) '\t']);
        end
        fprintf(fid,'\n'); %carriage return for header line
        
        %Write each x,y pair horizontally in the output file
        for j=1:maxsize
            fprintf(fid,'%g\t',x{1}(j)); %x series are the same! Write x{1} for all
            for i=1:n
                fprintf(fid,'%g\t',y{i}(j));
            end
            fprintf(fid,'\n'); %carriage return at end of each row
        end
    elseif xseriessame==0
        
        %write x, y column header
        for i=1:n
%             fprintf(fid,' x%g\t y%g\t',i,i);
            fprintf(fid,[' x_' char(hLeg.String(n+1-i)) '\t ' char(hLeg.String(n+1-i)) '\t']);  
        end
        fprintf(fid,'\n'); %carriage return for header line
        
        %Write each x,y pair horizontally in the output file
        for j=1:maxsize
            for i=1:n
                if j > length(x{i}) %the x-y pair has ended earlier than others
                    fprintf(fid,'\t \t'); %mark current x, y as empty
                elseif j <= length(x{i})
                    fprintf(fid,'%g\t %g\t',x{i}(j),y{i}(j));
                end
            end
            fprintf(fid,'\n'); %carriage return at end of each row
        end
        
    end %ending elseif xseriessame==0 statement
end %ending elseif n>1 statement

fclose(fid);
message{1}='Output from last run:';
message{3}=sprintf('File = %s',filename2);
message{5}=sprintf('Directory = %s',pathname2);
msgbox(message,'Attention','none');


end

