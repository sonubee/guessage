pragma solidity ^0.4.18;

contract GuessAge {

    //set age for Contract
    uint age;
    //mutliply to send ether
    uint oneWei = 1000000000000000000;
    //constructor
    function GuessAge (uint _age) payable public {
        age = _age;
    }

    function readTheQuestion () public pure returns (string question) {
        question = "Guess my Age";
    }

    //send your guess here
    function sendGuess (uint _guess) payable public returns (uint _returnAmount) {
        uint _difference;

        //ensure positive number for _difference
        if (_guess < age) {
            _difference = age - _guess;
        } else {
            _difference = _guess - age;
        }

        //calculate how much ether to send back
        _returnAmount = 5 - _difference;

        //if correct guess, send 10 ether
        if (_difference == 0) {
            msg.sender.transfer(10 * oneWei);
        //otherwise send the difference back if less than 5
        } else if (_difference <= 5 && _difference > 0) {
            msg.sender.transfer(_returnAmount * oneWei);
        }
    }
}
