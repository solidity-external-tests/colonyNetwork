/*
  This file is part of The Colony Network.

  The Colony Network is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  The Colony Network is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with The Colony Network. If not, see <http://www.gnu.org/licenses/>.
*/

pragma solidity >=0.5.8 <0.8.0;


contract TokenLockingDataTypes {

  event ColonyNetworkSet(address colonyNetwork);
  event TokenLocked(address token, uint256 lockCount);
  event UserTokenUnlocked(address token, address user, uint256 lockId);
  event UserTokenDeposited(address token, address user, uint256 amount, uint256 timestamp);
  event UserTokenWithdrawn(address token, address user, uint256 amount);
  event ReputationMinerPenalised(address miner, address beneficiary, uint256 tokensLost);

  struct Lock {
    // Users lock count
    uint256 lockCount;
    // Deposited balance
    uint256 balance;
    // Timestamp of last deposit
    uint256 timestamp;
  }
}
