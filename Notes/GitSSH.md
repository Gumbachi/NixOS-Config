# How to: Git with SSH [LINK](https://docs.codeberg.org/security/ssh-key/)

1. `ssh-keygen -t ed25519 -a 100 -C "codeberg"`
   1. `-t` = key type
   2. `-a` = key complexity (derivations)
   3. `-C` = comment (optional)
2. Follow prompts for file path (I leave default path) and passphrase
3. Copy token to clipboard (located in `~/.ssh/id_ed25519.pub`)
4. Go to tokens on GitHub/Codeberg/Whatever and add token
5. Test (Codeberg): `ssh -T git@codeberg.org`
   1. May need to type yes to contiue
