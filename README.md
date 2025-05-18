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

