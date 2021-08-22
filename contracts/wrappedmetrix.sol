// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./erc1363.sol";

/**
 * @title WrappedMetrix
 * @dev an ERC20 wrapper for Metrix
 */
contract WrappedMetrix is ERC1363 {
    event WrapMetrix(address indexed depositer, uint256 amount);
    event UnwrapMetrix(address indexed withdrawer, uint256 amount);

    constructor() ERC20("Wrapped Metrix", "wMRX") {}

    function decimals() public view virtual override returns (uint8) {
        return 8;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return super.totalSupply();
    }

    function balance() public view virtual returns (uint256) {
        return super.balanceOf(_msgSender());
    }

    function balanceOf(address account)
        public
        view
        virtual
        override
        returns (uint256)
    {
        return super.balanceOf(account);
    }

    function transfer(address recipient, uint256 amount)
        public
        virtual
        override
        returns (bool)
    {
        require(balanceOf(_msgSender()) >= amount);
        return super.transfer(recipient, amount);
    }

    fallback() external payable {
        wrap();
    }

    receive() external payable {
        wrap();
    }

    function deposit(uint256 amount) private {
        _mint(_msgSender(), amount);
    }

    function withdraw(uint256 amount) private {
        _burn(_msgSender(), amount);
    }

    function wrap() public payable {
        require(msg.value > 0);
        deposit(msg.value);
        emit WrapMetrix(_msgSender(), msg.value);
    }

    function unwrap(uint256 amount) public {
        uint256 startingBalance = balanceOf(_msgSender());
        require(startingBalance >= amount);
        withdraw(amount);
        require(
            balanceOf(_msgSender()) == startingBalance - amount,
            "WrappedMRX: Failed to burn Wrapped MRX"
        );
        payable(_msgSender()).transfer(amount);
        emit UnwrapMetrix(_msgSender(), amount);
    }
}
