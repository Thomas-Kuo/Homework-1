// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
// contract StudentV1 {
//     // Note: You can declare some state variable

//     function register() external returns (uint256) {
//         // TODO: please add your implementaiton here
//     }
// }

contract StudentV1 {
    uint256 private studentIdCounter = 1;  // 存储学生ID的计数器

    function register() external returns (uint256) {
        uint256 studentId = studentIdCounter;  // 获取当前ID
        studentIdCounter++;  // 增加计数器，为下一个学生准备
        return studentId;  // 返回新注册学生的ID
    }
}


/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
    }
}
