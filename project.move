module medical_licensing_board::license {
    use std::signer;
    use std::string::{String};
    use aptos_framework::account;
    use aptos_framework::event;
    use aptos_std::table::{Self, Table};

    /// Error codes
    const ENO_AUTHORITY: u64 = 1;
    const ELICENSE_ALREADY_EXISTS: u64 = 2;
    const ELICENSE_NOT_FOUND: u64 = 3;

    /// Represents a medical license
    struct License has store, drop, copy {
        doctor_address: address,
        license_id: String,
        specialization: String,
        expiration_date: u64,
        is_active: bool
    }

    /// Resource stored under the board's account
    struct LicensingBoard has key {
        licenses: Table<address, License>,
        board_admin: address,
        license_registered_events: event::EventHandle<LicenseRegisteredEvent>
    }

    /// Event emitted when a license is registered
    struct LicenseRegisteredEvent has drop, store {
        doctor_address: address,
        license_id: String,
        timestamp: u64
    }

    /// Initialize the licensing board (called by the admin)
    public entry fun initialize_board(board: &signer) {
        let board_addr = signer::address_of(board);
        
        move_to(board, LicensingBoard {
            licenses: table::new(),
            board_admin: board_addr,
            license_registered_events: account::new_event_handle<LicenseRegisteredEvent>(board)
        });
    }

    /// Register a new medical license
    public entry fun register_license(
        board: &signer,
        doctor_address: address, 
        license_id: String,
        specialization: String,
        expiration_date: u64
    ) acquires LicensingBoard {
        let board_addr = signer::address_of(board);
        let board_data = borrow_global_mut<LicensingBoard>(board_addr);
        
        // Check if caller is the board admin
        assert!(board_addr == board_data.board_admin, ENO_AUTHORITY);
        
        // Check if license already exists
        assert!(!table::contains(&board_data.licenses, doctor_address), ELICENSE_ALREADY_EXISTS);
        
        // Create and store license
        let license = License {
            doctor_address,
            license_id,
            specialization,
            expiration_date,
            is_active: true
        };
        
        table::add(&mut board_data.licenses, doctor_address, license);
        
        // Emit event
        event::emit_event(&mut board_data.license_registered_events, LicenseRegisteredEvent {
            doctor_address,
            license_id,
            timestamp: aptos_framework::timestamp::now_seconds()
        });
    }
}