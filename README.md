# 🚚 DeliveryApp::TrustScore

A Move module on the Aptos blockchain that manages trust scores for delivery personnel. It tracks the number of deliveries, positive reviews, and dynamically updates the trust score based on customer feedback.

---

## 🧠 Features

- 📥 Register delivery agents  
- ✅ Log completed deliveries  
- ⭐ Update trust score based on customer reviews  
- 📊 Track total deliveries and positive reviews  

---

## ⚙️ Core Functions

### `register_delivery_person(account: &signer)`
Registers a new delivery agent with:
- `trust_score: 50`
- `total_deliveries: 0`
- `positive_reviews: 0`

Throws error if already registered.

---

### `complete_delivery(owner_addr: address, positive_review: bool)`
Updates the delivery stats and adjusts the trust score:
- +5 for positive review (max 100)
- -3 for negative review (min 0)

---

## 📄 Deployment Info

- **Module Name:** `TrustScore`
- **Contract Address:** `0xe7ee73b1f80a0c8a7b6449a5648124f2d2fa022dae8d3eb8677b81e7cdfee5bf`

🔗 [View on Aptos Explorer](https://explorer.aptoslabs.com/txn/0xe7ee73b1f80a0c8a7b6449a5648124f2d2fa022dae8d3eb8677b81e7cdfee5bf?network=devnet)

---

## 📸 Deployment Proof

![image](https://github.com/user-attachments/assets/0a3ed28d-8471-46ba-8d5b-f4b5f8555edb)


_This screenshot confirms successful deployment on Aptos Devnet._

---

## 🚀 Example Usage

```move
register_delivery_person(&signer);
complete_delivery(@addr, true);  // Positive review
complete_delivery(@addr, false); // Negative review
