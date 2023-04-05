# testConsent

Consent with a constraint on .provenance.provenance is not displayed properly.

Given a constraint like

```fs
* provision.provision MS 
* provision.provision.provision 0..0
```

This profile is built properly, as examples given do show the boundary. But the rendering on the profile page is not proper:

1. The Differential does not show the MS
2. The Differential does not show the 0..0
3. The Key Elements does not show the MS
4. The Key elements does not show the 0..0
5. The Snapshot does not show the MS
6. The Snapshot does not show the 0..0

Presumed a problem because .provision is a recursive element.

## CI build

http://build.fhir.org/ig/JohnMoehrke/testConsent/branches/main/index.html

## Github

https://github.com/JohnMoehrke/testConsent
