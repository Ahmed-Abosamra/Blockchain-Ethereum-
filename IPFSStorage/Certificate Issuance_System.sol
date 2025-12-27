// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define the smart contract
contract UniversityCertificate {
    
    address public admin; // store the admin (contract deployer) address
    
    // Constructor runs once when the contract is deployed
    constructor() {
        admin = msg.sender; // set the deployer as the admin
    }

    // Define the structure of a Certificate
    struct Certificate {
        string studentName; // name of the student
        string courseName;  // course title
        string issueDate;   // date of certificate
    }

    // Mapping links each student address to their certificate
    mapping(address => Certificate) private certificates;

    // Modifier to restrict functions only to the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "You are not authorized"); // check admin
        _; // continue execution
    }

    // Event emitted when a certificate is issued
    event CertificateIssued(address indexed studentAddress, string studentName, string courseName);

    // Function to issue a certificate (admin only)
    function issueCertificate(
        address studentAddress,
        string memory studentName,
        string memory courseName,
        string memory issueDate
    ) public onlyAdmin {
        // Store certificate data in the mapping
        certificates[studentAddress] = Certificate(studentName, courseName, issueDate);
        // Emit an event for this issuance
        emit CertificateIssued(studentAddress, studentName, courseName);
    }

    // Function to view a student's certificate
    function viewCertificate(address studentAddress) public view returns (
        string memory studentName,
        string memory courseName,
        string memory issueDate
    ) {
        Certificate memory cert = certificates[studentAddress]; // get certificate
        return (cert.studentName, cert.courseName, cert.issueDate); // return details
    }

}
