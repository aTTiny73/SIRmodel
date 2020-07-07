            N = 1000;% Total population
            S = 997; %Susceptible
            I = 3; %Infected
            R = 0; %Removied
            T = 30; %Days
            
            % N = S + I + R // must be satisfied

            alpha = 0.5 %probability of infection expressed in percentage %.
            beta = 3 %Number of individuals that are in direct contact with a infected individual per day.
            gamma = 20 %Number of days needed for a person to recover or die.
            
            If=alpha*beta/N; %Infection rate
            Rr=1/gamma; %Recovery rate
            
            f = @(t,x) [-If*x(1)*x(2);If*x(1)*x(2)-Rr*x(2);Rr*x(2)] %Model SIR
            [t,xa]=ode45(f,[0 T], [S I R]); %Diferencial equation solution
            
            hold on
            plot(t,xa(:,1),'b') 
            plot(t,xa(:,2),'r')
            plot(t,xa(:,3),'g')
            legend({'S(t) = Susceptible','I(t) = Infected','R(t) = Removied'});
            hold off