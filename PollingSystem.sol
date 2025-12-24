// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PollingSystem {

    struct Poll {
        string title;
        string[] options;
        uint endTime;
        mapping(uint => uint) votes;
        mapping(address => bool) hasVoted;
        bool exists;
    }

    uint public pollCount;
    mapping(uint => Poll) private polls;

    function createPoll(
        string memory _title,
        string[] memory _options,
        uint _durationInMinutes
    ) public {
        require(_options.length >= 2, "At least two options required");

        pollCount++;

        Poll storage p = polls[pollCount];
        p.title = _title;
        p.options = _options;
        p.endTime = block.timestamp + (_durationInMinutes * 1 minutes);
        p.exists = true;
    }

    function vote(
        uint _pollId,
        uint _optionIndex
    ) public {
        Poll storage p = polls[_pollId];

        require(p.exists, "Poll does not exist");
        require(block.timestamp < p.endTime, "Voting period has ended");
        require(!p.hasVoted[msg.sender], "You have already voted");
        require(_optionIndex < p.options.length, "Invalid option index");

        p.votes[_optionIndex]++;
        p.hasVoted[msg.sender] = true;
    }

    function getWinner(
        uint _pollId
    ) public view returns (string memory) {
        Poll storage p = polls[_pollId];

        require(p.exists, "Poll does not exist");
        require(block.timestamp >= p.endTime, "Poll is still ongoing");

        uint highestVotes = 0;
        uint winningIndex = 0;

        for (uint i = 0; i < p.options.length; i++) {
            if (p.votes[i] > highestVotes) {
                highestVotes = p.votes[i];
                winningIndex = i;
            }
        }

        return p.options[winningIndex];
    }
}
