pragma solidity 0.8.16;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    mapping(uint => Candidate) public candidates;
    
    /*Solidity tip: mapping is like an array or hashmap
    it has a key value pair, here  uint is the datatype of the key 
    and Candidate is the data type of the value which is a Candidate struct
    candidates is the name of the mapping */

    // Store Candidates Count
    uint public candidatesCount;

/*Solidity tip: local variables which are NOT instance variables
    begin with an '_' */

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    constructor () public {
        addCandidate("Superman");
        addCandidate("Batman");
    }

    function setCandidate(string memory _name) public payable{
        name = _name;
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
    function getCandidate() public view returns(string memory) {
        return candidates[1].name;
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

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}