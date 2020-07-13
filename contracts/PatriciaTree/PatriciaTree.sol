pragma solidity >=0.5.8 <0.7.0;
pragma experimental "ABIEncoderV2";

import "./PatriciaTreeBase.sol";
import "./IPatriciaTree.sol";


/// @title Patricia tree implementation
/// @notice More info at: https://github.com/chriseth/patricia-trie
contract PatriciaTree is IPatriciaTree, PatriciaTreeBase {
  using Data for Data.Tree;

  function insert(bytes memory key, bytes memory value) public override {
    tree.insert(keccak256(key), value);
  }

  function getProof(bytes memory key) public override view returns (uint branchMask, bytes32[] memory _siblings) { // ignore-swc-127
    return getProofFunctionality(keccak256(key));
  }

  function getImpliedRoot(bytes memory key, bytes memory value, uint branchMask, bytes32[] memory siblings) public override
  pure returns (bytes32)
  {
    return getImpliedRootHashKey(key, value, branchMask, siblings);
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
