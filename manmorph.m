function out = manmorph(image)
    ip = iopen(image, ones(20,20));
    %out=image;
    out = iclose(ip, ones(20,20));