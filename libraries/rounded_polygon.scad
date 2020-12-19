module RoundedPolygon(P,fn=360)
{
    v = rounded_polygon_v(P,fn);
    polygon(v);
}

function rounded_polygon_v(P,fn) =
let
(
    step = 360 / fn,
    n = len(P),
    o_v = [ for(i=[0:n-1]) atan2(P[(i+1)%n][1] - P[i][1], P[(i+1)%n][0] - P[i][0]) + 90 + 360 ]
)
[
        for(i=[0:n-1])
            let
            (
                n1 = i,
                n2 = (i+1)%n,
                w1 = o_v[n1],
                w2 = (o_v[n2] < w1) ? o_v[n2] : o_v[n2] - 360,
                r = P[n2][2] ? P[n2][2] : 0,
                cw = (w1 + w2) / 2,

                angle = w1-w2,

                push = r / cos((w1-w2)/2),

                wpush = angle < 180 ? push : -push,
                wstart = angle < 180 ? w1 : w1-180,
                wstop = angle < 180 ? w2 : w2+180,
                wstep = angle < 180 ? -step : step,

                cx = P[n2][0] - cos(cw) * wpush,
                cy = P[n2][1] - sin(cw) * wpush
            )
            for (w=[wstart:wstep:wstop])
                [ cos(w)*r+cx, sin(w)*r+cy ]

] ;
