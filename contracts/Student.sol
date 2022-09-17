// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Student{
    
    //data members
    string _name;
    uint _roll;
    uint _yr;
    mapping( string=>uint ) _sub;
    uint _no_of_sub;
    bytes32 _Id;

    //constructor
    constructor (string memory name, uint roll, uint yr) {
        _name=name;
        _roll=roll;
        _yr=yr;
        _Id=blockhash(block.number);
    }

    
    
    //getter of data members
    function get_name() external view returns(string memory){
        return _name;
    }
    function get_yr() external view returns(uint){
        return _yr;
    }

    function get_roll() external view returns(uint){
        return _roll;
    }

    //function
    function getAttendance(string memory sub) external view returns(uint){
        return _sub[sub];
    }
    function getNumber() public view returns (uint){
        return block.number;
    }
    
    function markAsPresent(string memory sub) public{
        _sub[sub]++;
    }
    // function addAnewSubject(string memory sub) public {
    //     _sub[sub]=0;
    //     _no_of_sub++;
    // }

    //generating ID
    function generateId()private view returns(bytes memory){
        return abi.encode(_Id,_roll);
    } 
}