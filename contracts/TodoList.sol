// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TodoList {
    struct List {
        address Author;
        string Task;
        uint256 Timestamp;
    }
    // List[] Tasks;
    mapping(address => List[]) public Todo_List;

    address payable public Owner;

    constructor() {
        Owner = payable(msg.sender);
    }

    function addTask(string calldata _task) external payable {
        require(
            bytes(_task).length != 0,
            "Task Can not be empty! Please fill it."
        );
        // Owner.transfer(msg.value);
        Todo_List[msg.sender].push(List(msg.sender, _task, block.timestamp));
    }

    function GetAllTask() external view returns (List[] memory) {
        return Todo_List[msg.sender];
    }
}
