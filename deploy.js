async function main() {
    const HealthRecords = await ethers.getContractFactory("HealthRecords");
    const healthRecords = await HealthRecords.deploy();
    console.log("HealthRecords contract deployed to:", healthRecords.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  