# [1.0.0-beta.16](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.15...v1.0.0-beta.16) (2024-11-27)

### Bug Fixes

- bump minimum version to Bazel `7.4.0` ([bf86a08](https://git.gitlab.arm.com/bazel/ape/commit/bf86a08cc9775c710e5be3dff31b566976826ba5))

# [1.0.0-beta.15](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.14...v1.0.0-beta.15) (2024-11-20)

### Bug Fixes

- make `@ape//:*` targets private ([1f9ebb2](https://git.gitlab.arm.com/bazel/ape/commit/1f9ebb2549b67f08542e9f2b5f59349a8d000fae))
- switch `toolchain_local_select#map` to lazily fetch labels ([292d222](https://git.gitlab.arm.com/bazel/ape/commit/292d222b42ea54837ff049b9bce1146a96197515))

# [1.0.0-beta.14](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.13...v1.0.0-beta.14) (2024-10-30)

### Bug Fixes

- upgrade `toolchain_utils@1.0.0-beta.17` for Bazel 8+ support ([798f061](https://git.gitlab.arm.com/bazel/ape/commit/798f06125affc958172882443f827c4a9194311b))

### Features

- upgrade to `3.7.1` binaries ([ac2753e](https://git.gitlab.arm.com/bazel/ape/commit/ac2753e15fbef915ee3ecdd220efe76201e4e2fd))

# [1.0.0-beta.13](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.12...v1.0.0-beta.13) (2024-07-26)

### Bug Fixes

- **ape_toolchain:** make `toolchain_utils` constraints relative to `[@ape](https://git.gitlab.arm.com/ape)` module ([69001a5](https://git.gitlab.arm.com/bazel/ape/commit/69001a59b44c7618fc04f51ae741a884710daa60))

# [1.0.0-beta.12](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.11...v1.0.0-beta.12) (2024-07-22)

### Bug Fixes

- **assimilate:** make rule public ([d4b1be0](https://git.gitlab.arm.com/bazel/ape/commit/d4b1be09d711defd822cb581c43674924e04e656))
- **binary:** make rule public ([793c0f2](https://git.gitlab.arm.com/bazel/ape/commit/793c0f2e83b3f95ce7b147d6fc65c2a9c3c07d79))
- **entrypoint:** add `local = True` ([699fcb6](https://git.gitlab.arm.com/bazel/ape/commit/699fcb6c036b94a3505d4231ee522daafbb4391d))
- **entrypoint:** assimilate on Linux ([b4ff17b](https://git.gitlab.arm.com/bazel/ape/commit/b4ff17be88820667fd85fb37283e0e5d06130087))

### Features

- add `@ape//ape/toolchain/info:*` targets ([c767ec0](https://git.gitlab.arm.com/bazel/ape/commit/c767ec08894e1874cd183ffe99e76c4f25e1bc86))
- make `@ape//ape:*` targets publically visible ([4978c17](https://git.gitlab.arm.com/bazel/ape/commit/4978c177fd073b18eec3e600a5a2fe1e26f5b5f8))

# [1.0.0-beta.11](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.10...v1.0.0-beta.11) (2024-06-18)

### Bug Fixes

- **assimilate:** ensure Windows executable extension ([4e63652](https://git.gitlab.arm.com/bazel/ape/commit/4e636524a5cfa246a24d8478d2c2f2494fee0983))

# [1.0.0-beta.10](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.9...v1.0.0-beta.10) (2024-06-18)

### Bug Fixes

- alias assimilate targets ([1632a5f](https://git.gitlab.arm.com/bazel/ape/commit/1632a5fd837b2d8a0c1b73a6f5606e9a4ede0f72))
- **assimilate:** propagate runfiles ([afcd247](https://git.gitlab.arm.com/bazel/ape/commit/afcd247373004a05c4ede739a571cb9ef6b82d64))
- **assimilate:** symlink on Apple Silicon ([d3a0590](https://git.gitlab.arm.com/bazel/ape/commit/d3a0590934a3c560d3456942a202caeda4158e08))

### Code Refactoring

- **binary:** change from `target` to `src` ([ce0fb14](https://git.gitlab.arm.com/bazel/ape/commit/ce0fb14f408a2a5bd3afb5c2a3b0b8673bd7aed0))

### BREAKING CHANGES

- **binary:** The `ape_binary#target` attribute has changed to `ape_binary#src`.

This aligns to other `*_binary` rules such as `sh_binary`.

# [1.0.0-beta.9](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.8...v1.0.0-beta.9) (2024-06-17)

### Bug Fixes

- **assimilate:** symlink on Windows ([21c70a3](https://git.gitlab.arm.com/bazel/ape/commit/21c70a35358847fb6452f1b086d5ae208b0f9b33))
- **assimilate:** use ELF on Apple Silicon ([85084d3](https://git.gitlab.arm.com/bazel/ape/commit/85084d326695d94c033e9458ebad84cabb83455d))

# [1.0.0-beta.8](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.7...v1.0.0-beta.8) (2024-06-17)

### Bug Fixes

- **upload:** bump to `rules_curl@1.0.0-alpha.8` ([46be550](https://git.gitlab.arm.com/bazel/ape/commit/46be5506f8c2fe37a4d2bc649f1abb47c9f875fb))

### Features

- add `//:assimilate` ([4a43c39](https://git.gitlab.arm.com/bazel/ape/commit/4a43c3907740218bebcda4c6c5c6f1bc26c63c32))
- add `ape_assimilate` rule ([0ffc024](https://git.gitlab.arm.com/bazel/ape/commit/0ffc02472fac8cd93db0daa393fab072c5864e68))
- switch to assimilated binaries ([def0916](https://git.gitlab.arm.com/bazel/ape/commit/def09160eeaeba44a59717b23a04ac626584e2b9))

# [1.0.0-beta.7](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.6...v1.0.0-beta.7) (2024-05-22)

### Bug Fixes

- correct `ape-m1.c` upstream URL ([db0cb83](https://git.gitlab.arm.com/bazel/ape/commit/db0cb83293d1ef9df91882e71dfba8007dd2a7ad))
- rolled back `pigz` version ([6d098c8](https://git.gitlab.arm.com/bazel/ape/commit/6d098c8a6b80b86eda05c25996927e207c9878d8))

### Features

- add `chmod`/`cp`/`dd`/`echo`/`gzip`/`mkdir`/`mv`/`printf`/`rm`/`uname` ([b312d30](https://git.gitlab.arm.com/bazel/ape/commit/b312d30110dda67426e6db2e124a1c316340ec2b))

# [1.0.0-beta.6](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.5...v1.0.0-beta.6) (2024-05-07)

### Bug Fixes

- **binary:** find external runfiles on Windows ([a6a8df0](https://git.gitlab.arm.com/bazel/ape/commit/a6a8df04ed1181c30c01d68e6ef1b9e5512c1374))

# [1.0.0-beta.5](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.4...v1.0.0-beta.5) (2024-05-04)

### Bug Fixes

- upgrade to `toolchain_utils@1.0.0-beta.9` ([246b23b](https://git.gitlab.arm.com/bazel/ape/commit/246b23be38f24f24b360a4649a1f55706f5b651f))

# [1.0.0-beta.4](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.3...v1.0.0-beta.4) (2024-05-01)

### Bug Fixes

- **binary:** correct visibility of binary template ([3f33ed4](https://git.gitlab.arm.com/bazel/ape/commit/3f33ed44a93cc4c5405416b366752c817ba45da9))

# [1.0.0-beta.3](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.2...v1.0.0-beta.3) (2024-05-01)

### Bug Fixes

- **ape.pe:** implement a C# launcher ([4f667dd](https://git.gitlab.arm.com/bazel/ape/commit/4f667dd858d683e43176d538797931f52b39f036))
- **entrypoint:** remove toolchain target ([d9d60dc](https://git.gitlab.arm.com/bazel/ape/commit/d9d60dc262dafe669e661bc48f339f77322f4a6c))
- make `@ape//:*` binaries remote execution friendly ([7ae6293](https://git.gitlab.arm.com/bazel/ape/commit/7ae62935125b5e72ccaab248bc3a73b927901403))

### Features

- add `//ape/toolchain/ape:type` ([3e73cdb](https://git.gitlab.arm.com/bazel/ape/commit/3e73cdb63c21caede525321dc8f797ec9fcc1945))
- add `ape_binary` rule ([6577cd3](https://git.gitlab.arm.com/bazel/ape/commit/6577cd36eeaf814b38a66a3c1fbd1e7ce218f1e6))

### BREAKING CHANGES

- **entrypoint:** The `toolchain_symlink_target` has been removed from `ape_entrypoint`.

This symlink target used the repository context entrypoint which is not remote execution
friendly.

The targets were aliased as `@ape//:*` which have been corrected to be remove execution
friendly. Use those targets instead.

# [1.0.0-beta.2](https://git.gitlab.arm.com/bazel/ape/compare/v1.0.0-beta.1...v1.0.0-beta.2) (2024-04-25)

### Bug Fixes

- support for MinGW shell ([76a064c](https://git.gitlab.arm.com/bazel/ape/commit/76a064cb9299d6b66d6874d786f59509e78ee1ea))

# 1.0.0-beta.1 (2024-04-24)

### Bug Fixes

- correct PE launcher target ([3af329c](https://git.gitlab.arm.com/bazel/ape/commit/3af329c66df8c38e7cfce3478dc61862be49d684))
- mirror binaries ([b6b4b78](https://git.gitlab.arm.com/bazel/ape/commit/b6b4b780e211707ed14d9d466571ba7bd3fab0a7))
- register toolchains for supported platforms ([3788301](https://git.gitlab.arm.com/bazel/ape/commit/3788301606765c37ad6f22ebb01d86168319d355))

### Features

- add `ape_toolchain` macro ([e89d679](https://git.gitlab.arm.com/bazel/ape/commit/e89d679e18822f90ac64f14479932b0477ee8239))
- add `diff`, `diff3`, `sdiff`, `cmp` and `patch` ([a49565d](https://git.gitlab.arm.com/bazel/ape/commit/a49565d57425470e12d74a42e1f481bb70543ded))
- add `exec_compatible_with` to `ape_toolchain` ([fee2332](https://git.gitlab.arm.com/bazel/ape/commit/fee2332c067c7ee065fc14f15de86408fe8cd56a))
- added semantic release to bazel template ([a8a6634](https://git.gitlab.arm.com/bazel/ape/commit/a8a663411461dfd66fcc36635b1659a1beb3bd6b))
- expose `cosmo@v3.2.4` binaries ([c8dd4cb](https://git.gitlab.arm.com/bazel/ape/commit/c8dd4cbc64cd6c213b5f4bf73279b7b265d06f8c))
- support Apple silicon ([8725298](https://git.gitlab.arm.com/bazel/ape/commit/8725298cf9dddb7fbc40c466a7fcb403eb8dd7a5))
- upgrade to `cosmos@3.3.1` ([eb9f860](https://git.gitlab.arm.com/bazel/ape/commit/eb9f860f207ae8ccdea93ce637b0e5305a99fb14))
