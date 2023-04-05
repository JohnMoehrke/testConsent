# testConsent

Consent with a constraint on .provenance.provenance is not displayed properly.

Given a constraint like
```fs
* provision.provision MS 
* provision.provision.provision 0..0
```

1. The Differential does not show the MS
2. The Differential does not show the 0..0
3. The Key Elements does not show the MS
4. The key elements does not show the 0..0

