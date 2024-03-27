// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


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
        if (IClassroomV2(msg.sender).isEnrolled()) {
            return 123;
        } else {
            return 1000;
        }
    }

}



/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        if (gasleft() <= 7000) {
            return 123;
        } else {
            return 1000;
        }
    }
}
