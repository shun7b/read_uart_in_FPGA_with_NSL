/*

    Input clock frequency is expected to 50.000MHz.

*/

#define     TRUE    1'b1
#define     FALSE   1'b0

declare read {
// Serial receive data input
    input       RxD_i;                      // Receiver data input. LSB first

// Parallel receive data output
    output      Rx_Data_o[8];               // Receiver data in.
    func_out    RxD_Ready_o() ;             // Receiver data read ready flag.
    func_out    RxD_ParityError_o() ;       // Receiver data parity error.
    func_out    RxD_FramingError_o() ;      // Receiver data framing error.

// Command and Status bit
    
    input       Rx_BitLength_i[2] ;
                            // Receiver bit length. 5, 6, 7, and 8.
    input       Rx_ParityEN_i ;
                            // Parity enable bit.
                            // 1 = Parity enable, 0 = Parity disable.
    input       Rx_OddParity_i ;
                            // Odd parity bit. 1 = Odd parity, 0 = Even parity.
    input       Rx_Enable_i ;
                            // Receiver enable bit. 1 = Enable, 0 = disable

    output      Rx_operation_o ;
                            // Receiver function is active.
    output      Rx_ShiftClock_o ;
                            // Receiver shift clock. ( for timing check )
}