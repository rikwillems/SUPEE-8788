# SUPEE-8788

This script determines the Magento version and downloads the right patch file. For ease of use it also disables and clears compilation. After this take the normal steps for applying Magento patches.

#COMMUNITY EDITION 1.9.3 AND SUPEE-8788 

Community Edition 1.9.3 delivers over 120 quality improvements, as well as support for PHP 5.6. It also resolves critical security issues, including:

- Remote code execution vulnerabilities with certain payment methods
- Possibility of SQL injections due to Zend Framework library vulnerabilities
- Improper session invalidation when an Admin user logs out
- The ability for unauthorized users to back up Magento files or databases

The SUPEE-8788 patch addresses these security issues in earlier Magento versions. Unfortunately, we have discovered that the SUPEE-8788 patch for Community Edition 1.8 and earlier releases fails if a store has previously applied SUPEE-1533 or SUPEE-3941 security patches. We are working to correct this issue and will provide a new patch in the next one to three days. Until then, we are removing these versions of the SUPEE-8788 patch from distribution.


## Usage

```
bash < <(wget -q --no-check-certificate -O - https://raw.githubusercontent.com/rikwillems/SUPEE-8788/master/PATCH_SUPEE-8788.sh)
```
