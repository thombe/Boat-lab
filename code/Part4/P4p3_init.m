run('init.m')

A = [0 1 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 1 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 1;
    1 0 0 0 0 0];

B = [0 0;
    0 K_1;
    0 0;
    K_2 0;
    0 0;
    0 0];

C = [1 0 0 0 0 0;
    0 0 1 0 0 0;
    0 0 0 0 1 0];
 

C = [0 0 1 0 0 0;
	0 0 0 0 1 0];


% state cost matrix
% [pitch, pitch rate,elev, elev rate, travel, travel rate]
Q = diag([25,20,40,10,1,1]);
% actuation cost matrix [Vs, Vd]
R = 0.1*diag([1,1]);

K = lqr(A,B,Q,R);

% desired eigenvalues for the estimator
q = 4.8*eigs(A-B*K);
L = place(A', C', q).';

P = 20*eye(2);

heli_run();



