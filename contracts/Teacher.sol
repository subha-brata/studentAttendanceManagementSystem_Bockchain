// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "./Student.sol";

contract Teacher{
     string _name;
     string _sub;
     uint _yr;
    
     constructor (string memory name,string memory sub,uint yr ){
        _name=name;
        _sub=sub;
        _yr=yr;
    }
    
    function bytesToAddress(bytes32 data) private pure returns(address){
        return address(uint160(uint256 (data)));
    }
    mapping (uint=>address) studentList;
    
    function redg_student() private{
        studentList[Student(msg.sender).get_roll()]=msg.sender;
    }

    function markAStudent(uint roll) public{
        Student(studentList[roll]).markAsPresent(_sub);
    }

    function getAttendanceOfAStudent(uint num) public view  returns(uint){
        return Student(studentList[num]).getAttendance(_sub);
    }
}
