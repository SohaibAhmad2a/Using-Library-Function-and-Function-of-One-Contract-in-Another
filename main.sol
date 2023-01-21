pragma solidity ^0.8.0;
//Defining the library
library check{
    function sub(uint a, uint b) public returns(uint){
        return a+b;
    }
}


//Defining an Interface
interface letss{
    function first(uint a) external virtual returns(uint);
}


//Defining the contract on the interface
contract First is letss{
    using check for uint;
    uint c=11;
    
    function adds() public returns(uint){
        return c;
    }
    function first(uint a) external override returns(uint){ 
        return adds().sub(a);                   //This is how you can input value to a function of library that needs more than one input values.
    }                                           
    function two(uint a) external returns(uint){ 
        return c.sub(a);                        //adds function can be replaced with the variable c.
    }
}


//Using the function of contract First in a new contract.
contract second {
    First add;

    function updateadd(First addres) public {
        add=addres;                          //It will not work until you provide contract address to add variable.
    }
    function third(uint b) external returns(uint){
        return add.first(b);
    }
}
