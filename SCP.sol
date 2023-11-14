pragma solidity ^0.8.13;

contract SmartContract {
    address public owner;

    // Constructor to initialize the owner variable
    constructor() {
        owner = msg.sender;
    }

    // Modifier that checks if the sender is the owner
    modifier onlyOwner() {
        // Checks if value msg.sender is owner
        require(msg.sender == owner, "Access denied! Only the owner can call this function.");
        _;
    }

    function smartRequire(int _amount) public pure returns(int) {
        // 1st want you want to validate, 2nd will be passed if this function fails
        // if true it jumps to the next statment
        require(_amount > 45, "The Amount must be greater than 45");
        return _amount;
    }

    
      function smartAssert(int _amount) public pure returns(int){
        // Using assert() to check an invariant
        // if true, then this executes contiues and jumps to the next statement
        // if fail, output an error
        assert(_amount > 45);
        return _amount;
    }


    function smartRevert(int _amount)  view external onlyOwner returns(int){
        // Using revert() to revert the transaction with a custom error message
        // it helps to save gas
        // when not used it doesnt return the gas consumed
        // if used it returns the remaining gas
        if(!(_amount > 45)){
            revert("Amount must be greater than 45.");
        }
        return _amount;
    }
}
