run('init.m')

% Want pitch controller from t=0
pitch_control_start_time = 0; 

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

      %p p_dot e_dot PI EI
Q = diag([25;10;20;100;100]);

      %V_s V_d
R = 0.1*eye(2);

K = lqr(A,B,Q,R);
P = eye(2);

heli_run();