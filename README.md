# ATPG and Fault Coverage for 3 state FSM
- FSM Design using ONLY primitive gates
- Scan chain using gate-level scan DFFs
- Stuck-at fault injection
- Manual ATPG vector application
## ATPG
- ATPG vectors are manually computed and applied through scan chain.
- Outputs are observed to confirm fault detection.
## Features 
- FSM design is built using AND, OR, NOT, NAND, NOR gates only.
- No assign, always, or behavioral blocks used — only structural gate-level modeling.
- D Flip-Flops (DFFs) are built from gates to hold FSM states
- Scan chain is added to make sequential elements controllable and observable.
- Faults like Stuck-at-0 (SA0) and Stuck-at-1 (SA1) are injected at the net level using gates.
- Manual ATPG patterns are generated and applied through a testbench.
