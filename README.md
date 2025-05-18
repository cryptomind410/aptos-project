# 🩺 Medical Licensing Board Module (Move/Aptos)

This Move module provides a decentralized on-chain system for issuing and managing medical licenses using Aptos. Designed for governments, institutions, or decentralized health registries, this module ensures transparency, immutability, and authority-controlled access.

---

## 📦 Module: `medical_licensing_board::license`

### 📌 Overview

The module allows a designated board authority to:

- Initialize itself as the official licensing board  
- Register verified medical licenses for doctors  
- Emit immutable events when licenses are issued  
- Maintain uniqueness and validity of licenses per doctor  

---

## 🧱 Struct Definitions

### `License`

```move
struct License has store, drop, copy {
    doctor_address: address,
    license_id: String,
    specialization: String,
    expiration_date: u64,
    is_active: bool
}
struct LicensingBoard has key {
    licenses: Table<address, License>,
    board_admin: address,
    license_registered_events: event::EventHandle<LicenseRegisteredEvent>
}
struct LicenseRegisteredEvent has drop, store {
    doctor_address: address,
    license_id: String,
    timestamp: u64
}
## 📤 Deployment Info

- 📜 Contract Address: `0x6ea7...37f1`  
- 🔁 Published via: `code::publish_package_txn`  
- ✅ Status: Success  
- 🔗 Transaction Version: `23623477`  
- 🧾 Transaction Hash:  
  `0xe7ee73b1f80a0c8a7b6449a5648124f2d2fa022dae8d3eb8677b81e7cdfee5bf`

---

## 🖼 Image Proof
![image](https://github.com/user-attachments/assets/afb0c1f1-5814-4bc7-8ed6-69bfdb2193d6)


Below is a screenshot of the transaction confirming successful contract publishing to the Aptos devnet:

![Contract Deployment Proof](./e59be3a8-9a87-4387-837c-85d374573977.png)


