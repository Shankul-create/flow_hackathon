# 🧾 Interaction Logger Smart Contract

This project implements a **minimal Solidity smart contract** that logs user interactions along with timestamps — **without constructors, imports, or input parameters**.  
It demonstrates a simple and gas-efficient way to record and retrieve interaction history on-chain.

---

## 🚀 Overview

- **Purpose:** Record when users interact with the contract.  
- **Functionality:**
  - Log each interaction with `msg.sender` and `block.timestamp`
  - Emit an event for each interaction
  - Retrieve total count, latest interaction, or all interactions
- **Design Constraints:**
  - No constructors
  - No import statements
  - No input fields or function parameters

---

## 🧱 Technology Stack

- **Language:** Solidity `^0.8.20`  
- **Blockchain:** [Flow Testnet](https://testnet.flowscan.io/)  
- **Contract Type:** Logging / Event-based Storage  

> 💡 *Although written in Solidity, this implementation is deployed on the Flow-compatible EVM environment.*

---

## 📜 Contract Details

| Item | Description |
|------|--------------|
| **Contract Name** | `InteractionLogger` |
| **Deployed Network** | Flow Testnet |
| **Testnet Address** | `0x17B605e8BCc60eC02055d3695a0D7f5553B50714` |
| **Deployed/Used Contracts** | `InteractionLogger` |

---

## 🧩 Key Functions

| Function | Description | Inputs | Returns |
|-----------|--------------|---------|----------|
| `logInteraction()` | Records a new interaction with timestamp | None | `id` (uint256) |
| `totalInteractions()` | Returns total number of interactions logged | None | `count` (uint256) |
| `latestInteraction()` | Returns details of the most recent interaction | None | `(address, uint256, uint256)` |
| `getAllInteractions()` | Returns arrays of all users, timestamps, and IDs | None | Multiple arrays |

---

## 🪶 Events

```solidity
event InteractionLogged(address indexed user, uint256 timestamp, uint256 indexed id);
