% addpath ../util/
% 
% kappa = [1/.00437 1/.0124 1/.028];
% phi = [deg2rad(45);deg2rad(30);deg2rad(0)];
% ell = [210e-3;165e-3;110e-3];
% pts_per_seg = 30;
% 
% g = robotindependentmapping(kappa,phi,ell,pts_per_seg);
% 
% draw_ctcr(g,[30 60 90],[2e-3 1.5e-3 1e-3])
% outer middle inner

s_arc = [10 65 169]; %arc length of straight segment
c_arc = [100 100 41]; %arc length of curved segment
total = s_arc+c_arc;
q_alpha = deg2rad([20 45 0]);
q_beta = [0 0 10];
total = total + q_beta;

kappa = [0;4.37;0;12.4;0;28];
phi = [0;q_alpha(1);0;q_alpha(1)+q_alpha(2);0;sum(q_alpha)];

ell = 1e-3*[s_arc(1);
            c_arc(1);
            max(total(2)-(total(1))-c_arc(2),0);
            min(c_arc(2), total(2)-(total(1)));
            max(total(3)-(total(2))-c_arc(3),0);
            min(c_arc(3), total(3)-(total(2)))]
pts_per_seg = 30;

g = robotindependentmapping(kappa,phi,ell,pts_per_seg);

draw_ctcr(g,[30 60 90 120, 150, 180],[2e-3 2e-3 1.5e-3 1.5e-3 1e-3, 1e-3])
