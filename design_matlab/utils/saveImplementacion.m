function []=saveImplementacion(filename, cadena)

    fid=fopen( filename, 'w' ) ;

    if fid==-1
        disp ('File open not successful')
    else

        fprintf (fid, '%s', cadena);

        % do something with the file!
        closeresult=fclose ( fid) ;
        if closeresult==0
           % disp ('File close successful');
        else
        end
    end
end