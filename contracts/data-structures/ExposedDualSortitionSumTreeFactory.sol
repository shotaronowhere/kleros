// SPDX-License-Identifier: MI

pragma solidity ^0.4.24;

import "./DualSortitionSumTreeFactory.sol";

/**
 *  @title ExposedDualSortitionSumTreeFactory
 *  @authors [@epiqueras, @shotaronowhere] - <shawtarohgn@gmail.com>
 *  @dev Exposed version of DualSortitionSumTreeFactory for testing.
 */
contract ExposedDualSortitionSumTreeFactory {
    /* Storage */

    using DualSortitionSumTreeFactory for DualSortitionSumTreeFactory.DualSortitionSumTrees;
    DualSortitionSumTreeFactory.DualSortitionSumTrees internal dualSortitionSumTrees;

    /**
     *  @dev Public getter for sortitionSumTrees.
     *  @param _key The key of the tree to get.
     *  @return All of the tree's properties.
     */
    function _sortitionSumTrees(bytes32 _key) public view returns(uint K_draw, uint[] stackDraw, uint[] nodesDraw,uint K_set, uint[] stackSet, uint[] nodesSet, uint _threshold, uint _lastThresholdUpdate) {
        return (
            dualSortitionSumTrees.sortitionSumDrawTrees[_key].K,
            dualSortitionSumTrees.sortitionSumDrawTrees[_key].stack,
            dualSortitionSumTrees.sortitionSumDrawTrees[_key].nodes,
            dualSortitionSumTrees.sortitionSumSetTrees[_key].K,
            dualSortitionSumTrees.sortitionSumSetTrees[_key].stack,
            dualSortitionSumTrees.sortitionSumSetTrees[_key].nodes,
            dualSortitionSumTrees.threshold,
            dualSortitionSumTrees.lastThresholdUpdate
        );
    }

    /* Public */

    /**
     *  @dev Create a sortition sum tree at the specified key.
     *  @param _key The key of the new tree.
     *  @param _K_draw The number of children each node in the draw tree should have.
     *  @param _K_set The number of children each node in the set tree should have.
     */
    function _createTree(bytes32 _key, uint _K_draw, uint _K_set) public {
        dualSortitionSumTrees.createTree(_key, _K_draw, _K_set);
    }

    /**
     *  @dev Set a value of a tree.
     *  @param _key The key of the tree.
     *  @param _value The new value.
     *  @param _ID The ID of the value.
     */
    function _set(bytes32 _key, uint _value, bytes32 _ID) public {
        dualSortitionSumTrees.set(_key, _value, _ID);
    }

    /* Public Views */

    /**
     *  @dev Query the leaves of a tree.
     *  @param _key The key of the tree to get the leaves from.
     *  @param _cursor The pagination cursor.
     *  @param _count The number of items to return.
     *  @param _isSetTree true for Set Tree, false for Draw tree
     *  @return The index at which leaves start, the values of the returned leaves, and whether there are more for pagination.
     */
    function _queryLeafs(bytes32 _key, uint _cursor, uint _count, bool _isSetTree) public view returns(uint startIndex, uint[] values, bool hasMore) {
        return dualSortitionSumTrees.queryLeafs(_key, _cursor, _count, _isSetTree);
    }

    /**
     *  @dev Draw an ID from a tree using a number.
     *  @param _key The key of the tree.
     *  @param _drawnNumber The drawn number.
     *  @return The drawn ID.
     */
    function _draw(bytes32 _key, uint _drawnNumber) public view returns(bytes32 ID) {
        return dualSortitionSumTrees.draw(_key, _drawnNumber);
    }

    /** @dev Gets a specified candidate's associated value.
     *  @param _key The key of the tree.
     *  @param _ID The ID of the value.
     *  @return The associated value.
     */
    function _stakeOf(bytes32 _key, bytes32 _ID) public view returns(uint value) {
        return dualSortitionSumTrees.stakeOf(_key, _ID);
    }
}


