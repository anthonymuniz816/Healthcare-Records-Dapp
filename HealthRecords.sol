// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthRecords {
    struct Record {
        string encryptedData;
        address owner;
        address[] approvedProviders;
    }

    mapping(address => Record[]) private records;

    event RecordAdded(address indexed patient, uint recordIndex);
    event AccessGranted(address indexed patient, address indexed provider);
    event AccessRevoked(address indexed patient, address indexed provider);

    function addRecord(string memory encryptedData) public {
        records[msg.sender].push(Record({
            encryptedData: encryptedData,
            owner: msg.sender,
            approvedProviders: new address 
        }));
        emit RecordAdded(msg.sender, records[msg.sender].length - 1);
    }

    function grantAccess(uint recordIndex, address provider) public {
        require(msg.sender == records[msg.sender][recordIndex].owner, "Only owner can grant access");
        records[msg.sender][recordIndex].approvedProviders.push(provider);
        emit AccessGranted(msg.sender, provider);
    }

    function revokeAccess(uint recordIndex, address provider) public {
        require(msg.sender == records[msg.sender][recordIndex].owner, "Only owner can revoke access");
        for (uint i = 0; i < records[msg.sender][recordIndex].approvedProviders.length; i++) {
            if (records[msg.sender][recordIndex].approvedProviders[i] == provider) {
                records[msg.sender][recordIndex].approvedProviders[i] = records[msg.sender][recordIndex].approvedProviders[records[msg.sender][recordIndex].approvedProviders.length - 1];
                records[msg.sender][recordIndex].approvedProviders.pop();
                emit AccessRevoked(msg.sender, provider);
                break;
            }
        }
    }

    function getRecord(uint recordIndex) public view returns (string memory) {
        require(recordIndex < records[msg.sender].length, "Invalid record index");
        return records[msg.sender][recordIndex].encryptedData;
    }
}

