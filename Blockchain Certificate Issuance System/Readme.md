
## Overview
The **UniversityCertificate** smart contract is written in Solidity (`^0.8.0`).  
It allows a university admin to issue certificates to students and for anyone to view certificate details.  
The contract ensures that only the admin can issue certificates, and all data is stored securely on the blockchain.

---

## Constructor

**Function:** `constructor()`  
**Visibility:** public  
**Purpose:**  
- Initializes the contract.
- Sets the deployer as the `admin`.

**Explanation:**  
- `msg.sender` is the address deploying the contract.
- Only this admin address can issue certificates.

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
