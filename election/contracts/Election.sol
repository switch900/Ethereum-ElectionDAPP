// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Election {

	 // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
	
	// Store Candidates Count
    uint public candidatesCount;

	// Read/write Candidates
    mapping(uint => Candidate) public candidates;
	
	// Stores accounts that have already voted.
	mapping(address => bool) public voters;
	 
	constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
	
	function addCandidate (string memory _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
	
	function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
}