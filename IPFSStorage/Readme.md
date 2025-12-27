
# Decentralized File Storage DApp

This project demonstrates a complete **decentralized application workflow** by creating and deploying a smart contract that stores the **IPFS hash** of an uploaded file.  

It simulates a real-world **decentralized file storage system** on blockchain.

---

## Project Overview

The workflow includes:

1. Deploying a local Ethereum blockchain using **Ganache**.
2. Compiling, migrating, and testing a smart contract using **Truffle Suite**.
3. Uploading files to **IPFS** and storing their content hash in the smart contract.
4. Interacting with the contract to **store and retrieve** the file hash.

---

## Project Requirements

### 1. Local Blockchain Setup (Ganache)

- **Install Ganache**: Download and install the Ganache desktop application.  
- **Run a local blockchain instance**: Start Ganache to have a local Ethereum blockchain.  
- **Configure Truffle**: Connect Truffle to Ganache’s RPC server (usually `http://127.0.0.1:7545`).

---

### 2. Smart Contract Implementation

The smart contract should:

- **Store an IPFS hash** (CID) of the uploaded file.
- **Save/Update the hash**: Function to store or update the file hash.
- **Retrieve the hash**: Function to get the current stored file hash.

**Example Smart Contract Structure (Solidity):**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FileStorage {
    string private fileHash;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function storeHash(string memory _hash) public onlyAdmin {
        fileHash = _hash;
    }

    function getHash() public view returns (string memory) {
        return fileHash;
    }
}
