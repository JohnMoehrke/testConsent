# testConsent

Consent with a constraint on .provenance.provenance is not displayed properly.

Given a constraint like

```fs
* provision 1..1
* provision.provision MS 
* provision.provision.provision 0..0
```

This profile is built properly, as examples given do show the boundary. But the rendering on the profile page is not proper:

1. The Differential does not show the 0..0
2. The Key elements does not show the 0..0
3. The Snapshot does not show the 0..0

Presumed a problem because .provision is a recursive element.

Note that root and second level do seem to show properly.

## CI build

http://build.fhir.org/ig/JohnMoehrke/testConsent/branches/main/index.html

## Github

https://github.com/JohnMoehrke/testConsent
