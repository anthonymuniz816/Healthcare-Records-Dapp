# Healthcare-Records-Dapp
DApp that allows patients to manage their health records securely on the blockchain. This system will enable patients to share their medical history with healthcare providers while maintaining control over who accesses their information.

## System Manual

### System Overview
The decentralized health records management system is built on **blockchain technology** to ensure privacy, transparency, and security. The system uses **Solidity** for smart contracts, **Hardhat** for development, and **Web3.js** for interaction with the blockchain.

### System Requirements

#### Hardware:
- **Minimum 4 GB RAM**
- **10 GB available storage**
- **Internet connection** for blockchain interaction

#### Software:
- **Node.js** (v16 or above)
- **Hardhat** (latest version)
- **Web3.js library**
- **MetaMask** (for managing user accounts)
- A code editor like **Visual Studio Code**

### Setup Instructions

#### Step 1: Install Dependencies

1. **Install Node.js**:
    ```bash
    sudo apt install nodejs
    ```

2. **Initialize a new Hardhat project**:
    ```bash
    npx hardhat
    ```

3. **Install dependencies**:
    ```bash
    npm install hardhat web3 ethers dotenv
    ```

#### Step 2: Smart Contract Deployment

1. **Compile the smart contract**:
    ```bash
    npx hardhat compile
    ```

2. **Deploy the contract using a deployment script**:
    - Add your script in `scripts/deploy.js`.

3. **Run the deployment**:
    ```bash
    npx hardhat run scripts/deploy.js --network localhost
    ```

### System Components

#### Smart Contract (HealthRecords.sol):
- Manages **health records** with **encrypted data**.
- Ensures **access control** via `approvedProviders`.

#### Frontend:
- **HTML/CSS** for the user interface.
- **JavaScript** (Web3.js) for blockchain interaction.

#### Backend:
- **Node.js** for API and middleware.
- **Hardhat network** for local blockchain.

### Testing and Debugging

- **Write tests** in the `test` folder using Mocha/Chai:
    ```bash
    npx hardhat test
    ```

- **Use console logs** to debug in the Hardhat environment:
    ```bash
    npx hardhat console
    ```

## User Manual

### Introduction
This system allows users to store and manage their health records on a decentralized blockchain network, ensuring privacy, security, and access control.

### Getting Started

#### Install MetaMask:
1. Add the **MetaMask** extension to your browser.
2. Set up an **Ethereum wallet** within MetaMask.

#### Access the System:
- Navigate to the frontend interface via the provided URL or localhost on your browser.

### Using the System

#### 1. **Add a Record**
   - **Log in** with your MetaMask account.
   - Enter the **health record details** (encrypted data).
   - Click **"Submit"** to save the record on the blockchain.

#### 2. **Approve Providers**
   - Select a **record** from your list.
   - Add a **provider’s Ethereum address** to the `approvedProviders` list.
   - Click **"Approve"** to grant access to the provider.

#### 3. **View Records**
   - View your list of **records** on the dashboard.
   - Use the **record ID** to fetch detailed data (if permissioned).

#### 4. **Transfer Records**
   - Select a **record** to transfer ownership.
   - Input the **recipient’s Ethereum address**.
   - **Confirm the transaction** to complete the transfer.

### Troubleshooting

#### MetaMask Issues:
- Ensure your **wallet** is connected to the correct network (Hardhat or local Ethereum network).

#### Transaction Errors:
- Verify there are **sufficient funds** for gas fees.
- Confirm the provider’s **Ethereum address** is valid.

#### Record Not Found:
- Check if the **record ID** exists on the blockchain.
