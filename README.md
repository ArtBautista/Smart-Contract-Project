# Smart-Contract-Project

This Solidity program is a simple "Smart Contract" program that demonstrates the require(), assert() and revert() statments. The purpose of this program is to serve as a .

## Description

The require() statement is used to check for conditions that must be met in order for a function to execute successfully. If the condition is not met, the require() statement will revert the transaction and undo all changes. This is a good way to ensure that your smart contract is in a valid state before performing any operations.

The assert() statement consumes all remaining gas and reverts all changes made if it fails. The require() statement, on the other hand, only consumes gas up until that point and reverts state changes if it fails.
This means that the assert() statement should only be used for internal errors, or for analyzing invariants. An invariant is a condition that is always true for a given state of a program. For example, an invariant for a bank contract might be that the total balance of all accounts is always equal to the total amount of money deposited in the contract.

The revert() statement in Solidity is used to revert the entire transaction and undo all changes made so far. It is commonly used for error handling and to revert the state back to its original state.


### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SCP.sol). Copy and paste the following code into the file:

```Solidity
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling one of the three functions. Click on the smartRequire() contract in the left-hand sidebar, and input a amount to be sent, if the amount is greater than 45 it executes contiues and jumps to the next statement. but if the condition returns false it will output an error and "The Amount must be greater than 45". Click on the smartAssert() contract in the left-hand sidebar, and input a amount to be sent, if the amount is greater than 45 it executes contiues and jumps to the next statement. but if the condition returns false it will output an error. Click on the smartRequire() contract in the left-hand sidebar, and input a amount to be sent, if the amount is greater than 45 it executes contiues and jumps to the next statement. but if the condition returns false it will output an error, "Amount must be greater than 45 and will returns the remaining gas.


the sayHello function. Click on the "HelloWorld" contract in the left-hand sidebar, and then click on the "sayHello" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello World!" message.

## Authors

Art Eli Aluri B. Bautista
202010553@fit.edu.ph

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
