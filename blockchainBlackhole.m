% Number of nodes in the network
numNodes = 20;

% Communication range of nodes (in meters)
commRange = 100;

% Create random node positions within a square region
nodePositions = rand(numNodes, 2) * 1000;

% Compute Delaunay triangulation
DT = delaunayTriangulation(nodePositions);

% Extract row and column indices from the Delaunay triangulation connectivity list
[row, col] = find(tril(ones(size(DT.ConnectivityList, 1), size(DT.ConnectivityList, 2)), -1));

% Create a sparse adjacency matrix
adjacencyMatrix = sparse([DT.ConnectivityList(row,:); DT.ConnectivityList(col,:)], ...
                         [DT.ConnectivityList(col,:); DT.ConnectivityList(row,:)], ...
                         1, numNodes, numNodes);

% Ensure symmetric connectivity
adjacencyMatrix = double(adjacencyMatrix | adjacencyMatrix');



% Initialize blockchain for each node
blockchainCell = cell(1, numNodes);
for i = 1:numNodes
    blockchainCell{i} = Block(1, datetime('now'), 'Genesis Block', '');
end

% Implement AODV routing protocol (simplified) with blockchain
function [route, blockchain] = aodv(source, destination, adjacencyMatrix, blockchain)
    % Apply shortest path algorithm (e.g., Dijkstra's algorithm)
    % Here, we assume a simple shortest path calculation
    route = shortestpath(graph(adjacencyMatrix), source, destination);
    
    % Integrate blockchain operations
    % Add transaction data to the blockchain
    transactionData = struct('Source', source, 'Destination', destination);
    blockchain = addBlock(blockchain, transactionData);
end

% Function to add a new block to the blockchain
function blockchain = addBlock(blockchain, data)
    lastBlock = blockchain(end);
    newIndex = lastBlock.Index + 1;
    newTimestamp = datetime('now');
    newBlock = Block(newIndex, newTimestamp, data, lastBlock.Hash);
    blockchain = [blockchain newBlock];
end

% Test AODV routing with blockchain
sourceNode = 1;
destinationNode = numNodes;

% Without blackhole
[routeWithoutBlackhole, blockchainCell{sourceNode}] = aodv(sourceNode, destinationNode, adjacencyMatrix, blockchainCell{sourceNode});
disp('Route without blackhole:');
disp(routeWithoutBlackhole);

% With blackhole
blackholeNode = 10; % Introduce blackhole at node 10
[routeWithBlackhole, blockchainCell{sourceNode}] = aodv(sourceNode, destinationNode, adjacencyMatrix, blockchainCell{sourceNode});
disp('Route with blackhole:');
disp(routeWithBlackhole);

% Visualization of blackhole attack
% Visualization code here...

% Display connectivity graph
G = graph(adjacencyMatrix);
figure;
plot(G, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2), 'NodeLabel', {});

% Visualization of blackhole attack
figure;
p = plot(G, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2), 'NodeLabel', {});
highlight(p, sourceNode, 'NodeColor', 'r', 'MarkerSize', 10);
highlight(p, destinationNode, 'NodeColor', 'r', 'MarkerSize', 10);
highlight(p, blackholeNode, 'NodeColor', 'g', 'MarkerSize', 10);
highlight(p, routeWithoutBlackhole, 'EdgeColor', 'b', 'LineWidth', 2);
highlight(p, routeWithBlackhole, 'EdgeColor', 'r', 'LineWidth', 2);
legend('Nodes', 'Source/Destination', 'Blackhole', 'Route without blackhole', 'Route with blackhole');
title('Visualization of AODV connection');
