# 🩺 Medical Licensing Board Module (Move/Aptos)

A Move module deployed on the Aptos blockchain for managing trust and credibility of medical professionals. The system tracks licenses, successful treatments, and updates trust scores based on patient reviews and professional performance.

---

## 🧠 Features

- 📝 Register medical professionals  
- ✅ Log completed treatments  
- ⭐ Update trust score based on patient feedback  
- 📊 Track total treatments and positive outcomes  

---

## ⚙️ Core Functions

### `register_medical_professional(account: &signer)`
Registers a new medical professional with:
- `trust_score: 50`
- `total_treatments: 0`
- `positive_reviews: 0`

Throws error if already registered.

---

### `record_treatment(doctor_addr: address, successful: bool)`
Updates the treatment stats and adjusts the trust score:
- ➕ +5 for successful treatment (max 100)  
- ➖ -3 for unsuccessful treatment (min 0)  

---

## 📄 Deployment Info

- **Project Name:** Medical Licensing Board Module (Move/Aptos)  
- **Module Name:** TrustScore  
- **Contract Address:** `0xe7ee73b1f80a0c8a7b6449a5648124f2d2fa022dae8d3eb8677b81e7cdfee5bf`

🔗 [View on Aptos Explorer](https://explorer.aptoslabs.com/txn/0xe7ee73b1f80a0c8a7b6449a5648124f2d2fa022dae8d3eb8677b81e7cdfee5bf?network=devnet)

---

## 📸 Deployment Proof

![image](https://github.com/user-attachments/assets/3a1b9202-80ea-4f10-8e05-efda3d605351)


_This image confirms the successful contract deployment of the Medical Licensing Board Module on Aptos Devnet._

---

## 🚀 Example Usage

```move
register_medical_professional(&signer);
record_treatment(@doctor_addr, true);  // Successful treatment
record_treatment(@doctor_addr, false); // Unsuccessful treatment
