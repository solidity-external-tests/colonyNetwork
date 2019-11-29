pragma solidity >=0.5.8 <0.7.0;
pragma experimental "ABIEncoderV2";

import "./PatriciaTreeBase.sol";
import "./IPatriciaTreeNoHash.sol";


/// @title Patricia tree implementation
/// @notice More info at: https://github.com/chriseth/patricia-trie
contract PatriciaTreeNoHash is IPatriciaTreeNoHash, PatriciaTreeBase {

  function insert(bytes32 key, bytes memory value) public override {
    tree.insert(key, value);
  }

  function getProof(bytes32 key) public override view returns (uint branchMask, bytes32[] memory _siblings) {
    return getProofFunctionality(key);
  }

  function getImpliedRoot(bytes32 key, bytes memory value, uint branchMask, bytes32[] memory siblings) public override
  pure returns (bytes32)
  {
    return getImpliedRootNoHashKey(key, value, branchMask, siblings);
  }

  function getRootHash() public override(IPatriciaTreeBase, PatriciaTreeBase) view returns (bytes32 rootHash) {
      return super.getRootHash();
  }

  function getRootEdge() public override(IPatriciaTreeBase, PatriciaTreeBase) view returns (Data.Edge memory e) {
      return super.getRootEdge();
  }

  function getNode(bytes32 hash) public override(IPatriciaTreeBase, PatriciaTreeBase) view returns (Data.Node memory n) {
      return super.getNode(hash);
  }

}
