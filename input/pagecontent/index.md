
Consent with a constraint on .provenance.provenance is not displayed properly.

Given a constraint like

```fs
* provision 1..1
* provision.provision MS 
* provision.provision.provision 0..0
```

This [profile is built properly](StructureDefinition-PrivacyConsent.html), as examples given do show the boundary. But the rendering on the profile page is not proper:

1. The Differential does not show the 0..0
2. The Key elements does not show the 0..0
3. The Snapshot does not show the 0..0

Note that it does seem to need some constraint stated at prior recurisions. For example it is worse if the root provision is not 1..1.

Presumed a problem because .provision is a recursive element.
- [Simple Consent Privacy with no provision](StructureDefinition-DegenerateConsent.html)
- [Simple Consent Privacy with root provision but nothing more](StructureDefinition-OneConsent.html)

Note that root and second level do seem to show properly.
