function [K, L, fug_vap, fug_liq, Z_vap, Z_liq, x_fractions, y_fractions] = flash_solver(EOS)
% solves homework 3 problem for either Soave-Redlich-Kwong or Peng-Robinson
% usage: [K, L, fug_vap, fug_liq, Z_vap, Z_liq, x_fractions, y_fractions] = flash_solver(EOS)
% EOS = 'PR' or 'SRK'
% All indices [CO2, CH4, n-C4, n-C10]

R = 10.731; %ft^3*psi/degRankin/lb-mol
T_flash = 180+459.67; %R
P_flash = 2000; %psi
Tc = [87.890, -116.590, 305.690, 652.010] + 459.67; % deg R
Pc = [1069.87, 667.20, 551.10, 305.68]; % psi
Tr = T_flash ./ Tc;
Pr = P_flash ./ Pc;
z_fractions = [0.65, 0.20, 0.05, 0.10]; % [CO2, CH4, n-C4, n-C10] in mol fraction
omega = [0.2250, 0.0080, 0.1930, 0.4900];
MW = [44.010, 16.043, 58.124, 142.285]; % g/mol

switch EOS % set up correct parameters
    case 'PR' % Binary Interaction Parameters PREOS [CO2, CH4, n-C4, n-C10]
        kij = [0, 0.1200, 0.1200, 0.1141; 
            0.1200,0,0.0000,0.0422; 
            0.1200,0.0000,0,0.0078; 
            0.1141,0.0422,0.0078,0];
        u = 2; w = -1; b = 0.07780*R.*Tc./Pc; a = 0.45724*R^2.*Tc.^2./Pc;
        for i=1:length(omega) % solve for m parameters
            if omega(i) < 0.4
                m(i) = 0.37464+1.54226.*omega(i)-0.26992.*omega(i).^2;
            else
                m(i) = 0.3796+1.4850.*omega(i)-0.1644.*omega(i).^2+0.01667.*omega(i).^3;
            end
        end
        alpha = (1+m.*(1-Tr.^(1/2))).^2;
    case 'SRK' % Binary Interaction Parameters SRKEOS [CO2, CH4, n-C4, n-C10]
        kij = [0,0.1200,0.1200,0.1304; 
            0.1200,0,0.0000,0.0411; 
            0.1200,0.0000,0,0.0067; 
            0.1304,0.0411,0.0067,0];
        u = 1; w = 0; b = 0.08664*R.*Tc./Pc; a = 0.42748*R^2.*Tc.^2./Pc;
        m = 0.48+1.574.*omega-0.176.*omega.^2; alpha = (1+m.*(1-Tr.^(1/2))).^2;
end
% seeding values for K & L
K = exp(5.37*(1+omega).*(1-1./Tr))./Pr; %From notes
L = 0.6;
accel = 1.0; % acceleration parameter

for i = 1:10^5 % Newton-Raphson Driver
    [F, F_prime, fug_vap, fug_liq, Z_vap, Z_liq] = rachford_fn();
    if abs(sum(fug_vap./fug_liq)-4) <= 10^-8     % convergence check
%         sprintf('Convergence Achieved in %d iterations!', i)
        break
    end
    L = L-F/F_prime;
    K = K.*(fug_liq./fug_vap).^accel;
end
[x_fractions, y_fractions] = return_xy(K,L,z_fractions);

    function [F, F_prime, fug_vap, fug_liq, Z_vap, Z_liq] = rachford_fn()
        [x_fractions, y_fractions] = return_xy(K,L,z_fractions);
       
        [Z_root, a_alpha, A, B] = return_roots(y_fractions); % Find roots for vapor Z factor
        Z_vap = Z_root(1); % Z-factor Chooses the maximum real root.
        phi_vap = return_phi(Z_vap, y_fractions); % fugacity coefficient
        
        [Z_root, a_alpha, A, B] = return_roots(x_fractions); % Find roots for liquid Z factor
        Z_liq = Z_root(3); % Z-factor Chooses the minimum real root
        phi_liq = return_phi(Z_liq, x_fractions); % fugacity coefficient
        
        fug_liq = P_flash*x_fractions.*phi_liq; % Fugacities
        fug_vap = P_flash*y_fractions.*phi_vap;
       
        F = sum(z_fractions.*(1-K)./(K+L*(1-K))); % Rachford-Rice outputs
        F_prime = sum(-z_fractions.*(1-K).^2./(K+L*(1-K)).^2);

        function [Z_root, a_alpha, A, B] = return_roots(fractions)
            % returns the roots, A, B, and a_alpha for the mixture
            a_alpha = 0; b_sum = 0;
            for i = 1:4
                for j = 1:4
                    a_alpha = a_alpha + fractions(i)*fractions(j)*(1-kij(i,j))*(a(i)*alpha(i)*a(j)*alpha(j))^0.5;
                end
                b_sum = b_sum + fractions(i)*b(i);
            end
            A = a_alpha*P_flash/R^2/T_flash^2;
            B = b_sum*P_flash/R/T_flash;
            Z_root = roots([1, -(1+B-u*B), +(A+w*B^2-u*B-u*B^2), +(-A*B-w*B^2-w*B^3)]);
        end
        
        function phi = return_phi(Z, fractions)
            % Returns phi fugacity coefficient for each component of the mixture given
            % the Z factor and component fractions.
            phi = 0;
            for i = 1:4
                sigma_jsum = 0; Bi = b(i)*P_flash/R/T_flash;
                for j = 1:4
                    sigma_jsum =  sigma_jsum + fractions(j)*(1-kij(i,j))*(a(i)*alpha(i)*a(j)*alpha(j))^0.5;
                end
                phi(i) = exp(Bi./B*(Z-1)-log(Z-B)+A./(B.*(u^2-4*w)^0.5).*(Bi./B-2/a_alpha*sigma_jsum)*log((2*Z+B*(u+(u^2-4*w)^0.5))/(2*Z+B*(u-(u^2-4*w)^0.5))));
            end
        end
    end

    function [x_f, y_f] = return_xy(K,L,z) % Returns liq and vap fractions
        x_f = z./(K+(1-K)*L); y_f = x_f.*K;
    end
end

