# SUPEE-8788

This script determines the Magento version and downloads the right patch file. For ease of use it also disables and clears compilation. After this take the normal steps for applying Magento patches.

# Issues 

- Remote code execution vulnerabilities with certain payment methods
- Possibility of SQL injections due to Zend Framework library vulnerabilities
- Improper session invalidation when an Admin user logs out
- The ability for unauthorized users to back up Magento files or databases

The SUPEE-8788 patch addresses these security issues in earlier Magento versions. Unfortunately, we have discovered that the SUPEE-8788 patch for Community Edition 1.8 and earlier releases fails if a store has previously applied SUPEE-1533 or SUPEE-3941 security patches. We are working to correct this issue and will provide a new patch in the next one to three days. Until then, we are removing these versions of the SUPEE-8788 patch from distribution.

# V2

The new v2 patch addresses two issues:

- Removes compatibility issues with SUPEE-1533 and SUPEE-3941 security patches experienced by merchants using Community Edition 1.8 and earlier releases.
- Resolves issues with some 3rd party payment methods during checkout.

# Installation process:

- Revert SUPEE-8788 if you have already installed it.
- Revert SUPEE-1533 if you have already installed it.
- Deploy SUPEE-3941 if it hasn’t already been installed.
- Install the new SUPEE-8788 v2 patch. This patch includes SUPEE-1533, so you don’t need to worry about re-installing it.

## Usage

```
bash < <(wget -q --no-check-certificate -O - https://raw.githubusercontent.com/rikwillems/SUPEE-8788/master/PATCH_SUPEE-8788.sh)
```
