// RUN: %swift -typecheck %s -verify -target armv6m-none-none-eabi -parse-stdlib
// RUN: %swift -typecheck %s -verify -target armv7m-none-none-eabi -parse-stdlib
// RUN: %swift -typecheck %s -verify -target armv7em-none-none-eabi -parse-stdlib
// RUN: %swift -typecheck %s -verify -target armv8m.base-none-none-eabi -parse-stdlib
// RUN: %swift -typecheck %s -verify -target armv8m.main-none-none-eabi -parse-stdlib
// RUN: %swift -typecheck %s -verify -target armv8.1m.main-none-none-eabi -parse-stdlib
// RUN: %swift -typecheck %s -verify -target armv7em-apple-none-macho -parse-stdlib

#if _hasAtomicBitWidth(_64) || _hasAtomicBitWidth(_128)
// M-profile cores only have word-sized atomics.
#error("M-profile targets should not have 64-bit or 128-bit atomics")
#endif

#if arch(arm) && os(none) && _pointerBitWidth(_32)
#if _hasAtomicBitWidth(_8) && _hasAtomicBitWidth(_16) && _hasAtomicBitWidth(_32)
#warning("8, 16 and 32-bit atomics available") // expected-warning {{8, 16 and 32-bit atomics available}}
#endif
#endif
