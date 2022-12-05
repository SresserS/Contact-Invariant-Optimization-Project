function [ cost ] = OptimizationPhase1( s )
[cost, f, u, pose_dotdot ] = L_Physics(s);
[cost] = L_Task(s, f, u, pose_dotdot);
end

function [ cost ] = OptimizationPhase2( s )
lci = L_CI(s);
[lphysics,f, u, pose_dotdot] = L_Physics(s);
ltask = L_Task(s,f,u,pose_dotdot);
lhint = L_Hint(s);
lphysics = 0.000001*lphysics
cost = lci + ltask + lphysics + lhint;
end

function [ cost ] = OptimizationPhase3(s)
lci= L_CI(s);
[lphysics,f, u, pose_dotdot] = L_Physics(s);
ltask = L_Task(s,f,u,pose_dotdot);
lphysics = 0.00001*lphysics
cost = lci + lphysics + ltask;
end
