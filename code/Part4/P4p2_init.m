run('init.m')

A = [0 1 0;
    0 0 0;
    0 0 0;];
B = [0 0;
    0 K_1;
    K_2 0;];

       %p p_dot e_dot
Q = diag([30;5;100]);

      %V_s V_d
R = 0.7*eye(2);

K = lqr(A,B,Q,R);
P = eye(2);
sys=ss(A-B*K,B*P,[1 0 0;0 0 1],zeros(2,2)); % Closed loop
hsys=tf(sys); % Transfer function
P = inv(evalfr(hsys,0))

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