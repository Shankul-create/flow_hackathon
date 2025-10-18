// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title InteractionLogger
/// @notice Logs interactions (no inputs) with timestamp and sender; allows reading history via parameterless views.
/// @dev No imports and no constructor as requested.
contract InteractionLogger {
    /// @notice A single recorded interaction
    struct Interaction {
        address user;
        uint256 timestamp;
        uint256 id;
    }

    /// @notice Emitted when someone logs an interaction
    event InteractionLogged(address indexed user, uint256 timestamp, uint256 indexed id);

    // Storage of interactions
    Interaction[] private interactions;

    /// @notice Record an interaction. No inputs required.
    /// @return id The id assigned to this interaction (index in the array).
    function logInteraction() external returns (uint256 id) {
        id = interactions.length; // next index
        interactions.push(Interaction({ user: msg.sender, timestamp: block.timestamp, id: id }));
        emit InteractionLogged(msg.sender, block.timestamp, id);
    }

    /// @notice Get total number of interactions recorded. No inputs.
    function totalInteractions() external view returns (uint256) {
        return interactions.length;
    }

    /// @notice Get the latest (most recent) interaction. No inputs.
    /// @dev If none recorded yet, returns zeroed values.
    function latestInteraction() external view returns (address user, uint256 timestamp, uint256 id) {
        uint256 len = interactions.length;
        if (len == 0) {
            return (address(0), 0, 0);
        }
        Interaction storage it = interactions[len - 1];
        return (it.user, it.timestamp, it.id);
    }

    /// @notice Return full history as separate arrays (no inputs).
    /// @dev Be careful: returning a large history may be expensive to read off-chain; this is parameterless per requirement.
    function getAllInteractions() external view returns (address[] memory users, uint256[] memory timestamps, uint256[] memory ids) {
        uint256 len = interactions.length;
        users = new address[](len);
        timestamps = new uint256[](len);
        ids = new uint256[](len);

        for (uint256 i = 0; i < len; ++i) {
            Interaction storage it = interactions[i];
            users[i] = it.user;
            timestamps[i] = it.timestamp;
            ids[i] = it.id;
        }
    }
}
