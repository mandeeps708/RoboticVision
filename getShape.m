function an = getShape(im, shape)
    [~,mx] = ilabel(im);
    b = iblobs(im);
    array = zeros(1,mx); %created a matrix for storing labels of matching blobs
    idisp(im);
    for i =1:mx
    switch(shape)
        case 'circle'
            if(b(i).circularity>=0.896 && b(i).circularity <=1.1)
            array(i) = b(i).label;
            end
        case 'triangle'
            if(b(i).circularity>=0.57 && b(i).circularity <=0.69)
            array(i) = b(i).label;
            end
        case 'square'
            if(b(i).circularity>=0.70 && b(i).circularity <0.895 && b(i).touch == 0)
                array(i) = b(i).label;
            end
        otherwise
            fprintf('Enter valid input');
    end
                exclude = array(array~=0);
    end
    an = b(exclude); %here the resulting blobs's features are stored
    an.plot_box;
end