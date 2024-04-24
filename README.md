
# Blockchain-Enabled AODV Routing Simulation for Secure MANETs

This project simulates a Mobile Ad-hoc Network (MANET) environment, integrating the AODV routing protocol with blockchain technology to enhance security. Nodes communicate using AODV, with blockchain maintaining a secure record of transactions. The script initializes node positions, blockchain structures, and functions to implement routing and blockchain operations. It tests routing with and without a [Blackhole Attack](https://github.com/atanu16/Simulation-of-AODV-Routing-with-Blackhole-Attack), visualizing network connectivity and attack effects. By combining AODV with blockchain, the project explores potential solutions for securing MANETs against attacks while ensuring reliable communication. This simulation offers insights into decentralized and tamper-resistant communication protocols for dynamic network environments.

- [Blackhole Attack](https://github.com/atanu16/Simulation-of-AODV-Routing-with-Blackhole-Attack) <-- Checkout Simulation of AODV Routing with Blackhole Attack from here 

- Both are Same Code but this one is contain Blockchain implementation.


![Simulation ](https://github.com/atanu16/Blockchain-Enabled-AODV-Routing-Simulation-for-Secure-MANETs/assets/83860778/03cc6d70-31e9-45b1-a476-fdc392d53058)


## Blockchain Implementation


In the provided MATLAB code, blockchain technology is integrated to enhance the `Security` and `Trustworthiness` of the routing process. Here's how blockchain contributes to the output:

### Transaction Data Recording:
- Each time the AODV routing protocol determines a route from a source node to a destination node, transaction data related to this routing decision is recorded in the blockchain of the source node.
- The transaction data typically includes information such as the `source node ID`, `destination node ID`, `timestamp`, and possibly `Other relevant details` about the routing process.



### Immutable Record Keeping:
- The blockchain maintains an immutable ledger of transactions. Each block in the blockchain contains a cryptographic hash of the previous block, creating a chain of blocks that cannot be altered without modifying subsequent blocks.
- This immutability ensures that the recorded routing transactions cannot be tampered with or altered after they are recorded. It provides a secure and reliable record of routing decisions made by each node in the network.

### Auditable Routing History:
- The transparency and auditability of the blockchain enable stakeholders to inspect the routing history of each node in the network.
- Participants can verify the integrity of routing decisions by examining the blockchain, ensuring that the recorded transactions accurately reflect the routing paths chosen by each node.

## Security against Manipulation:
- By recording routing transactions in a blockchain, the network mitigates the risk of fraudulent activity or manipulation by malicious nodes.
- Even in the presence of a blackhole node or other malicious entities, the recorded routing data remains secure and tamper-resistant, providing assurance to network participants about the reliability of the routing process.
## Consensus Mechanisms:
- While not explicitly shown in the provided code, blockchain networks often employ consensus mechanisms to validate and agree on the state of the blockchain.
- These mechanisms ensure that only valid routing transactions are added to the blockchain and that no single node can manipulate the blockchain's contents. It enhances the overall security and reliability of the routing process.

## Output Explanation

Blockchain enhances output by ensuring data integrity and trust in routing. Each node maintains an immutable ledger recording routing transactions, preventing tampering. Despite the presence of a blackhole node, blockchain verifies and secures routing paths, maintaining the same route, thus ensuring reliability in the network's operation. Here's an explanation of each line of output :

- Route without blackhole :
1. This line indicates the route obtained when there is no blackhole node present in the network.
2. The route starts from node 1 (source node), passes through node 2, and ends at node 20 (destination node).
3. This suggests that the routing protocol successfully found a path from the source to the destination without any disruptions or interceptions.
- Route with blackhole :
1. This line indicates the route obtained when a blackhole node is present in the network.
2. Similar to the route without a blackhole, it starts from node 1, passes through node 2, and ends at node 20.
3. Despite the presence of the blackhole node, the route remains the same, indicating that the blackhole node may not have affected the routing path in this specific scenario.

#### `Note` - The presence of node 2 in the route suggests that, based on the network topology and connectivity, node 2 lies on the shortest path between the source node (node 1) and the destination node (node 20).











## Nodes


The nodes are visually distinguished by three different colors: red, blue, and green. Let's explain the significance of each color:

 - Red Nodes:
The source node and destination node are both represented by red color.
These nodes are crucial in routing protocols as they represent the starting point (source) and the destination of data packets.
- Blue Nodes:
Nodes along the route without a blackhole are represented by blue color.
These nodes are part of the shortest path between the source and destination nodes in the absence of any malicious activity.
- Green Nodes:
The blackhole node is represented by green color.
This node is introduced into the network as part of the simulation to mimic a malicious node that disrupts communication by dropping or altering packets.






## Installation
Add this `blockchainBlackhole.m` and `Block.m`  in your matlab and run `blockchainBlackhole.m` 

```bash
blockchainBlackhole.m
```

```bash
Block.m
```


## Authors

- [@Atanu](https://www.github.com/atanu16)

