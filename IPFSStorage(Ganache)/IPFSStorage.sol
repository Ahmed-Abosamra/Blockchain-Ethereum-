
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract IPFSStorage {

    // mapping: IPFS hash => file name
    mapping(string => string) private files;

    // ========= Events =========
    event FileSaved(string ipfsHash, string name);
    event FileUpdated(string ipfsHash, string oldName, string newName);

    // ========= Save new file =========
    function save_file(string memory _ipfsHash, string memory _name) public {
        require(bytes(files[_ipfsHash]).length == 0, "File already exists");
        files[_ipfsHash] = _name;

        emit FileSaved(_ipfsHash, _name);
    }

    // ========= Update existing file =========
    function update_file(string memory _ipfsHash, string memory _newName) public {
        require(bytes(files[_ipfsHash]).length != 0, "File does not exist");

        string memory oldName = files[_ipfsHash];
        files[_ipfsHash] = _newName;

        emit FileUpdated(_ipfsHash, oldName, _newName);
    }

    // ========= Get file name by IPFS hash =========
    function get_file(string memory _ipfsHash) public view returns (string memory) {
        require(bytes(files[_ipfsHash]).length != 0, "File not found");
        return files[_ipfsHash];
    }
}
