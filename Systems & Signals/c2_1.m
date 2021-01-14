
u = step(-1);
rec = rect(0.5);
tri = triangle(4);

function y=step(t)
    y = (t >=0 );
end

function y=rect(t)
    y = sign( t +0.5)-sign( t -0.5) > 0;
end

function y=triangle(t)
    y = (1-abs(t)).*(t>=-1).*(t<1);
end
