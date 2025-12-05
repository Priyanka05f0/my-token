MyToken – ERC-20 Token Project

This project implements a fully functional ERC-20 token using Solidity and Remix IDE.
The token includes all standard ERC-20 functions along with proper input validation, event emissions, and testing.

🚀 Token Details
Property	Value
Name	MyToken
Symbol	MTK
Decimals	18
Initial Supply	1,000,000 MTK (1 million tokens)
Total Supply (after decimals)	1,000,000 × 10¹⁸
📘 What Are ERC-20 Tokens?

ERC-20 is a widely used standard on Ethereum for creating fungible tokens.
All ERC-20 tokens share the same interface, allowing:

Wallets to recognize token balances

Exchanges to list the token

Smart contracts to interact consistently

This standardization ensures interoperability and predictable behavior across the Ethereum ecosystem.

🧩 Implemented Features

This contract includes all mandatory ERC-20 functions:

✔ Core Functions

totalSupply()

balanceOf(address)

transfer(address to, uint256 amount)

allowance(address owner, address spender)

approve(address spender, uint256 value)

transferFrom(address from, address to, uint256 value)

✔ Events

Transfer(address indexed from, address indexed to, uint256 value)

Approval(address indexed owner, address indexed spender, uint256 value)

✔ Input Validation

Prevent transfers to the zero address

Prevent transfers with insufficient balance

Prevent spending more than approved allowance

🛠️ Deployment Instructions (Remix IDE)
1. Open Remix IDE

Go to: https://remix.ethereum.org/

2. Create Contract File

Create MyToken.sol inside a contracts/ folder

Paste the Solidity code

3. Compile

Select compiler 0.8.x

Click Compile MyToken.sol

Ensure 0 errors / 0 warnings

4. Deploy

Go to Deploy & Run

Environment: Remix VM (Prague)

Enter constructor inputs:

_name: "MyToken"
_symbol: "MTK"
_decimals: 18
_initialSupply: 1000000


Click Deploy

5. After Deployment

Your contract instance appears under Deployed Contracts.

🧪 Testing Scenarios Executed
### 1️⃣ Token Metadata Retrieval

Functions tested:

name()

symbol()

decimals()

totalSupply()

getTokenInfo()

All returned correct values.

2️⃣ Simple Transfer Test

Transferred 1,000,000,000,000,000,000 wei (1 MTK)

Balance decreased from sender

Balance increased for recipient

Transfer event emitted

3️⃣ Approve & transferFrom Test

Scenario:

Account A approves 50 MTK for Account B

Account B successfully performs transferFrom(A → C, 50 MTK)

Validations observed:

Allowance decreased accordingly

Balances updated

Approval and Transfer events emitted

4️⃣ Failure Case Tests

Tested invalid operations:

Transfer more than balance → revert (insufficient balance)

transferFrom without enough allowance → revert (allowance exceeded)

Transfer to zero address → revert

These confirm correct validation logic.

📂 Project Structure
my-token/
│── contracts/
│     └── MyToken.sol
│── README.md
│── screenshots/
      ├── compilation.png
      ├── deployment.png
      ├── token-info.png
      ├── transfer-test.png
      ├── events.png
      ├── approve-transferfrom.png (optional)

📘 What I Learned

From this project, I gained understanding of:

How the ERC-20 standard works

How token balances and allowances are managed

Event-driven architecture in Ethereum

The importance of validation (zero address, balances, allowances)

How to test smart contracts using Remix IDE

How to deploy and document Solidity projects professionally

This project helped me build confidence in writing and interacting with Ethereum smart contracts.

📎 License

This project is released under the MIT License.
