# SimpleVoting Smart Contract – Function Documentation

## Overview
The **SimpleVoting** smart contract is written in Solidity (`^0.8.0`).  
It allows a decentralized voting system where an admin can add candidates, and users can vote for them.  
The contract ensures that:
- Only the admin can add candidates.
- Each address can vote only once.
- Anyone can query the winner.

---

## Constructor

**Function:** `constructor()`  
**Visibility:** public  
**Purpose:**  
- Initializes the contract.
- Sets the deployer of the contract as the `admin`.

**Explanation:**  
- `msg.sender` is the address deploying the contract.  
- Only this admin can add candidates.

---

## Modifier

**Modifier:** `onlyAdmin`  
**Purpose:** Restrict access to admin-only functions.

**Code:**
```solidity
modifier onlyAdmin() {
    require(msg.sender == admin, "You are not authorized");
    _;
}
