MaxIt = 100;          % Maximum Number of Iterations
result=zeros(MaxIt,3);
for It=1:MaxIt
    clearvars -except result It
    It
    %% Problem Definition
    
    CostFunction = @(x) Rosenbrock(x);        % Cost Function
    
    nVar = 5;             % Number of Decision Variables
    
    VarSize = [1 nVar];   % Decision Variables Matrix Size
    
    VarMin = -2.048;         % Decision Variables Lower Bound
    VarMax = 2.048;         % Decision Variables Upper Bound
    
    Foptimal=0;             % The real function evaluation at the global optmimum
    
    r = 0.6;	% Neighborhood Radius
    
    %% Bees Algorithm Parameters
    
    
    
    
    MaxEvaluations=2e+6;   % Maximum number of function evaluations
    Evaluations=0;          % counter of number of function evaluations
    
    MaxError=10^-3;
    Error=inf;
    
    nScoutBee = 60;                           % Number of Scout Bees
    
    nSelectedSite = round(0.5*nScoutBee);     % Number of Selected Sites
    
    nEliteSite = round(0.25*nSelectedSite);    % Number of Selected Elite Sites
    
    nSelectedSiteBee = round(0.5*nScoutBee);  % Number of Recruited Bees for Selected Sites
    
    nEliteSiteBee = 2*nSelectedSiteBee;       % Number of Recruited Bees for Elite Sites
    
    
    
    rdamp = 0.95;             % Neighborhood Radius Damp Rate
    
    %% Initialization
    
    % Empty Bee Structure
    empty_bee.Position = [];
    empty_bee.Cost = [];
    
    % Initialize Bees Array
    bee = repmat(empty_bee, nScoutBee, 1);
    
    % Create New Solutions
    for i = 1:nScoutBee
        bee(i).Position = unifrnd(VarMin, VarMax, VarSize);
        bee(i).Cost = CostFunction(bee(i).Position);
    end
    
    % Sort
    [~, SortOrder] = sort([bee.Cost]);
    bee = bee(SortOrder);
    
    % Update Best Solution Ever Found
    BestSol = bee(1);
    
    % Array to Hold Best Cost Values
    %BestCost = zeros(MaxIt, 1);
    
    %% Bees Algorithm Main Loop
    
    while Evaluations<=MaxEvaluations && Error>=MaxError
        
        
        % Elite Sites
        for i = 1:nEliteSite
            
            bestnewbee.Cost = inf;
            
            for j = 1:nEliteSiteBee
                newbee.Position = PerformBeeDance(bee(i).Position, r);
                newbee.Cost = CostFunction(newbee.Position);
                Evaluations=Evaluations+1;
                if newbee.Cost<bestnewbee.Cost
                    bestnewbee = newbee;
                end
            end
            
            if bestnewbee.Cost<bee(i).Cost
                bee(i) = bestnewbee;
            end
            
        end
        
        % Selected Non-Elite Sites
        for i = nEliteSite+1:nSelectedSite
            nSelectedSiteBee=round(0.5*nScoutBee*bee(1).Cost/bee(i).Cost);
            bestnewbee.Cost = inf;
            
            for j = 1:nSelectedSiteBee
                newbee.Position = PerformBeeDance(bee(i).Position, r);
                newbee.Cost = CostFunction(newbee.Position);
                Evaluations=Evaluations+1;
                if newbee.Cost<bestnewbee.Cost
                    bestnewbee = newbee;
                end
            end
            
            if bestnewbee.Cost<bee(i).Cost
                bee(i) = bestnewbee;
            end
            
        end
        
        % Non-Selected Sites
        for i = nSelectedSite+1:nScoutBee
            bee(i).Position = unifrnd(VarMin, VarMax, VarSize);
            bee(i).Cost = CostFunction(bee(i).Position);
            Evaluations=Evaluations+1;
        end
        
        % Sort
        [~, SortOrder] = sort([bee.Cost]);
        bee = bee(SortOrder);
        
        % Update Best Solution Ever Found
        BestSol = bee(1);
        % Store Best Cost Ever Found
        %BestCost(it) = BestSol.Cost;
        
        % checks the error in the function value
        Error=abs(BestSol.Cost-Foptimal);
        
        % Display Iteration Information
        %disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
        
        % Damp Neighborhood Radius
        r = r*rdamp;
        
    end
    if Error<=MaxError
        success=1;
    else
        success=0;
    end
    result(It,:)=[Evaluations BestSol.Cost success];
end
%% Results

% figure;
% %plot(BestCost, 'LineWidth', 2);
% semilogy(BestCost, 'LineWidth', 2);
% grid on;
% xlabel('Iteration');
% ylabel('Best Cost');

