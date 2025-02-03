# LIFO-and-FIFO-Buffer-design-in-Verilog
This repository contains Verilog implementations of FIFO (First-In-First-Out) and LIFO (Last-In-First-Out) buffers, fundamental data structures used in digital design and VLSI applications.

🔹 FIFO Buffer
A FIFO (First-In-First-Out) buffer is a queue-based memory structure where data is written and read in the same order. It is widely used in data streaming, inter-process communication, and pipelined architectures. This implementation supports:

Parameterized depth and width
Synchronous read/write operations
Full and empty flag detection
Circular buffer mechanism

🔹 LIFO Buffer
A LIFO (Last-In-First-Out) buffer, also known as a stack, stores data in a way where the last written entry is read first. It is commonly used in stack-based computation, recursive function execution, and memory management. This implementation includes:

Push and pop operations
Stack overflow and underflow detection
Configurable size and bit width
