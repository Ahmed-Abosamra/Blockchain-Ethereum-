// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simple Voting Smart Contract
contract SimpleVoting {

    address public admin; // Admin address (contract deployer)

    // Constructor: runs once when contract is deployed
    constructor() {
        admin = msg.sender; // Set deployer as admin
    }

    // Candidate structure
    struct Candidate {
        string name;      // Candidate name
        uint voteCount;   // Number of votes received
    }

    mapping(uint => Candidate) public candidates; // Map candidate ID to Candidate
    uint public candidatesCount; // Total number of candidates

    mapping(address => bool) public hasVoted; // Track if an address has voted

    // Modifier to restrict functions to admin only
    modifier onlyAdmin() {
        require(msg.sender == admin, "You are not authorized");
        _;
    }

    // Admin can add a new candidate
    function addCandidate(string memory _name) public onlyAdmin {
        candidatesCount++; // Increase candidate count
        candidates[candidatesCount] = Candidate(_name, 0); // Add new candidate with 0 votes
    }

    // Function to vote for a candidate
    function vote(uint _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted"); // Prevent double voting
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate"); // Check valid candidate

        candidates[_candidateId].voteCount++; // Increase vote count
        hasVoted[msg.sender] = true; // Mark voter as voted
    }

    // Function to get the winner (candidate with highest votes)
    function getWinner() public view returns (string memory winnerName, uint winnerVotes) { 
        uint maxVotes = 0;
        uint winnerId = 0;

        // Loop through all candidates
        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerId = i;
            }
        }

        if (winnerId > 0) {
            return (candidates[winnerId].name, candidates[winnerId].voteCount); // Return winner details
        } else {
            return ("No votes yet", 0); // If no votes cast
        }
    }
}
