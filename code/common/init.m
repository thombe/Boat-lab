% Oppdatert høsten 2006 av Jostein Bakkeheim
% Oppdatert høsten 2008 av Arnfinn Aas Eielsen
% Oppdatert høsten 2009 av Jonathan Ronen
% Updated fall 2010, Dominik Breu
% Updated fall 2013, Mark Haring
% Updated spring 2015, Mark Haring

clear;

% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.40; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.65; % Motor mass [kg]
Pi = 3.1415;
% Moments of interia [kg*m^2]
J_p = 2*m_p*l_p*l_p; 
J_e = m_c*l_c*l_c+2*m_p*l_h*l_h;
J_lambda = m_c*l_c*l_c + 2*m_p*(l_h*l_h+l_p*l_p);

% Calibration of the encoder and hardware
Joystick_gain_x = 1;
Joystick_gain_y = -1;
 
 % Offset from start elevation to equilibrium
e_offset = -25*Pi/180;
Vs_star = 6.25; % Equilibrium output voltage
K_f = (2*m_p - m_c*l_c/l_h)* g/Vs_star; % Motor constant
pitch_control_start_time = 3; 

% Constants in the linearized model
K_1 = l_p*K_f/J_p; 
K_2 = l_h*K_f/J_e; 
K_3 = (m_c*g*l_c - 2*m_p*g*l_h)/J_e;

e_tilde_ref = 0;