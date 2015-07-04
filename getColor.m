function out = getColor(image,  color)
    Y = image(:,:,1)+image(:,:,2)+image(:,:,3);
    redChroma = image(:,:,1) ./ Y;
    greenChroma = image(:,:,2) ./Y;
    blueChroma = image(:,:,3) ./Y;
    thresholdRed = 0.45;
    thresholdGreen = 0.45;
    thresholdBlue = 0.45;
    prompt = 'Do you want to set threshold value?[y/n]';
    q = input(prompt,'s');
    if(strcmp(q,'y'))
        %prom2='For which color you want to set threshold?';
        %q2 = input(prom2,'s');
        prom3='Enter threshold value:';
        q3=input(prom3);
        if(strcmp(color,'red'))
            thresholdRed= q3;
        elseif(strcmp(color,'blue'))
            thresholdBlue= q3;
        elseif(strcmp(color,'green'))
            thresholdGreen= q3;
        else
            fprintf('Enter valid color: red, green, blue');
        end
    else
        fprintf('OK entering applying default threshold...');
        %fprintf(q3);
    end
        thresholdRed
        thresholdGreen
        thresholdBlue
    

    redBinary = redChroma > thresholdRed;
    greenBinary = greenChroma > thresholdGreen;
    blueBinary = blueChroma > thresholdBlue;
    
    switch(color)
        case 'red'
            out = manmorph(redBinary);
            
        case 'blue'
            out = manmorph(blueBinary);
            
        case 'green'
            out = manmorph(greenBinary);
            
        otherwise
            fprintf('Invalid color option. Use red, blue or green in single quotes only.');
    end
   % if clr=='red'
     %   color = redBinary;
    %else
       % if clr=='green'
      %      color = greenBinary;
     %   end
    %    if clr=='blue'
   %         color = blueBinary;
  %      end
 %   end
%end
%if(clr =='red')
%'\n value is red';
%elseif(clr =='blue')
%'\n value is blue';
%elseif(clr=='green')
%fprintf('\n value is green');
%else
%fprintf('\n none of values are matching');
%fprintf('\n exact value is %d',a);
%end
%color = fprintf('value of color is %d', clr);
%end



