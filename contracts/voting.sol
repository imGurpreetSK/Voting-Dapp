pragma solidity ^0.4.6;


contract voting {

/* mapping field below is equivalent to an associative array or hash.
 The key of the mapping is candidate name stored as type bytes32 and value is
an unsigned integer to store the vote count
*/
    mapping (bytes32 => uint8)  public votesReceived;

/* Solidity doesn't let you pass in an array of strings in the constructor (yet).
We will use an array of bytes32 instead to store the list of candidates
*/
    bytes32[] public candidateList;

/* This is the constructor which will be called once when you
deploy the contract to the blockchain. When we deploy the contract,
we will pass an array of candidates who will be contesting in the election
*/
    function voting(bytes32[] candidateNames){
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidateName) returns (uint8){
        if (validCandidate(candidateName) == false) {
            throw;
        }
        return votesReceived[candidateName];
    }

    function voteForCandidate(bytes32 candidateName){
        if (validCandidate(candidateName) == false) throw;
        votesReceived[candidateName] += 1;
    }

    function validCandidate(bytes32 candidate) returns (bool){
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }

}
