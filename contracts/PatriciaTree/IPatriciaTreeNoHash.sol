pragma solidity >=0.5.8; // ignore-swc-103
pragma experimental "ABIEncoderV2";

import {Data} from "./Data.sol";
import "./IPatriciaTreeBase.sol";


/// @title Interface for Patricia trees
/// @notice More info at: https://github.com/chriseth/patricia-trie
abstract contract IPatriciaTreeNoHash is IPatriciaTreeBase {

  /// @notice Insert the `key`/`value`in the appropriate place in the tree
  function insert(bytes32 key, bytes memory value) public virtual;

  /// @notice Returns the Merkle-proof for the given `key`
  /// @return branchMask Bitmask with high bits at the positions in the `key` where we have branch nodes (bit in key denotes direction)
  /// @return _siblings Hashes of sibling edges
  function getProof(bytes32 key) public virtual view returns (uint branchMask, bytes32[] memory _siblings);

  /// @notice Calculates and returns a root hash for the `key`, `value`, `branchMask` and `siblings`
  /// @return rootHash The calculated hash
  function getImpliedRoot(bytes32 key, bytes memory value, uint256 branchMask, bytes32[] memory siblings) public virtual pure returns (bytes32 rootHash);

}
