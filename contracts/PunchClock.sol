// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract PunchClock {

    enum PunchTypes {
      In,
      Out
    }

    struct Punch {
      uint userId;
      uint companyId;
      uint datetime;
      PunchTypes punchType;
    }

    Punch[] allPunches;

    function punchIn(uint userId, uint companyId) public returns (uint256)
    {
        Punch memory punch = Punch(userId, companyId, block.timestamp, PunchTypes.In);
        allPunches.push(punch);

        return block.timestamp;
    }

    function punchOut(uint userId, uint companyId) public returns (uint256)
    {
        Punch memory punch = Punch(userId, companyId, block.timestamp, PunchTypes.Out);
        allPunches.push(punch);

        return block.timestamp;
    }

    function getPunches(uint userId) public returns (Punch[] memory)
    {
        Punch[] memory userPunches;
        uint totalPunches = 0;

        for (uint i = 0; i < allPunches.length; i++) {
          if (allPunches[i].userId == userId) {
            userPunches[totalPunches] = allPunches[i];
            totalPunches++;
          }
        }
        return userPunches;
    }
}