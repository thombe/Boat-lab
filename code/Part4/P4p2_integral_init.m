run('init.m')

A = [0 1 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0;
    1 0 0 0 0;
    0 0 1 0 0];

B = [0 0;
    0 K_1;
    K_2 0;
    0 0;
    0 0];   

% state cost matrix [pitch, pitch rate, elev rate, gamma, sigma]
Q = diag([25,5,20,100,100]);
 % actuation cost matrix [Vs, Vd]
R = 0.1*diag([1,1]);

K = lqr(A,B,Q,R);
P = eye(2);

A_hat = [0 1 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 1 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 1;
    1 0 0 0 0 0];

B_hat = [0 0;
    0 K_1;
    0 0;
    K_2 0;
    0 0;
    0 0];

C_hat = [1 0 0 0 0 0;
    0 0 1 0 0 0;
    0 0 0 0 1 0];

q = [-60,-60,-40,-40,-20,-20];
L = place(A_hat', C_hat', q).';

heli_run();