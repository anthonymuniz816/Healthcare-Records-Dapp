let web3;
let contract;
const contractAddress = 'YOUR_CONTRACT_ADDRESS_HERE'; // Replace with your deployed contract address
const abi = [ /* ABI from your compiled contract */ ];

async function init() {
    if (window.ethereum) {
        web3 = new Web3(window.ethereum);
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        const accounts = await web3.eth.getAccounts();
        document.getElementById('wallet-address').innerText = `Connected: ${accounts[0]}`;
        contract = new web3.eth.Contract(abi, contractAddress);
        loadRecords(accounts[0]);
    } else {
        alert('Please install MetaMask!');
    }
}

async function loadRecords(address) {
    const recordsList = document.getElementById('records-list');
    recordsList.innerHTML = ''; // Clear existing records

    const records = await contract.methods.records(address).call();
    records.forEach((record, index) => {
        const listItem = document.createElement('li');
        listItem.className = 'list-group-item';
        listItem.innerText = record.encryptedData;
        recordsList.appendChild(listItem);
    });
}

async function addRecord() {
    const encryptedData = document.getElementById('encryptedData').value;
    const accounts = await web3.eth.getAccounts();

    await contract.methods.addRecord(encryptedData).send({ from: accounts[0] });
    document.getElementById('encryptedData').value = ''; // Clear input
    loadRecords(accounts[0]); // Reload records
}

document.getElementById('connect-wallet').onclick = init;
document.getElementById('add-record').onclick = addRecord;
