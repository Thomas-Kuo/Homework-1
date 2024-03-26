// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
// contract StudentV1 {
//     // Note: You can declare some state variable

//     function register() external returns (uint256) {
//         // TODO: please add your implementaiton here
//     }
// }

// contract StudentV1 {
//     uint256 private studentIdCounter = 1;  // 存储学生ID的计数器

//     function register() external returns (uint256) {
//         uint256 studentId = studentIdCounter;  // 获取当前ID
//         studentIdCounter++;  // 增加计数器，为下一个学生准备
//         return studentId;  // 返回新注册学生的ID
//     }
// }
// contract StudentV1 {
//     uint256 private studentIdCounter = 1;
//     bool private isFirstStudent = true;

//     function register() external returns (uint256) {
//         if (isFirstStudent) {
//             isFirstStudent = false;
//             return 1000;  // 确保第一个学生的ID满足 ClassroomV1 的条件
//         } else {
//             return studentIdCounter++;  // 后续学生返回正常递增的ID
//         }
//     }
// }
// contract StudentV1 {
//     uint256 private studentIdCounter = 2;  // 从2开始计数，因为第一次调用将返回1000
//     bool private firstCall = true;

//     function register() external returns (uint256) {
//         if (firstCall) {
//             firstCall = false;
//             return 1000;  // 第一次调用返回1000
//         }
//         return studentIdCounter++;  // 后续调用返回递增的ID
//     }
// }
// contract StudentV1 {
//     uint256 private studentIdCounter = 2;  // 从2开始计数，因为特殊处理第一个学生
//     bool private isFirstStudentRegistered = false;

//     function register() external returns (uint256) {
//         if (!isFirstStudentRegistered) {
//             isFirstStudentRegistered = true;
//             return 1000;  // 第一个学生注册返回1000
//         }
//         return studentIdCounter++;  // 后续学生返回递增的ID
//     }
// }
// contract StudentV1 {
//     uint256 private studentIdCounter = 3;  // 从3开始计数
//     bool private firstRegisterCall = true;

//     function register() external returns (uint256) {
//         if (firstRegisterCall) {
//             firstRegisterCall = false;
//             return 1000;  // 第一次调用返回1000
//         } else if (studentIdCounter == 3) {
//             studentIdCounter++;  // 跳过3以避免与第一次调用冲突
//         }
//         return studentIdCounter++;  // 第二次及以后的调用返回递增的ID
//     }
// }
contract StudentV1 {
    uint256 private registerCallCount = 0;

    function register() external returns (uint256) {
        registerCallCount++;

        if (registerCallCount == 2) {
            // 第二次调用返回123，以满足测试条件
            return 123;
        } else {
            // 其他情况返回一个不影响ClassroomV1逻辑的值
            return 1000;
        }
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
