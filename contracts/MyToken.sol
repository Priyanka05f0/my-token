// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balances[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(to != address(0), "ERC20: transfer to zero address");
        require(balances[msg.sender] >= amount, "ERC20: insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        require(spender != address(0), "ERC20: approve to zero address");
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender) external view returns (uint256) {
        return allowances[owner][spender];
    }

    function transferFrom(address owner, address to, uint256 amount) external returns (bool) {
        require(owner != address(0), "ERC20: transfer from zero address");
        require(to != address(0), "ERC20: transfer to zero address");
        require(balances[owner] >= amount, "ERC20: insufficient balance");
        require(allowances[owner][msg.sender] >= amount, "ERC20: allowance exceeded");

        allowances[owner][msg.sender] -= amount;
        balances[owner] -= amount;
        balances[to] += amount;

        emit Transfer(owner, to, amount);
        return true;
    }

    // -----------------------
    // Step 7: Optional helper functions
    // -----------------------

    // Returns the total supply (convenience wrapper)
    function getTotalSupply() external view returns (uint256) {
        return totalSupply;
    }

    // Returns token metadata in one call: (name, symbol, decimals, totalSupply)
    function getTokenInfo() external view returns (
        string memory,
        string memory,
        uint8,
        uint256
    ) {
        return (name, symbol, decimals, totalSupply);
    }
}
